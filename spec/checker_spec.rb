require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'fakeweb'

describe "Checker" do
  
  let(:notification_code) { "B7CEC7-4521D221D2EC-CFF43F1F959E-0C9B2E" }
  let(:checker)  { PagseguroCatcher::Checker.new(notification_code, 'transaction') }
  let(:url) { "https://ws.pagseguro.uol.com.br/v2/transactions/notifications/B7CEC7-4521D221D2EC-CFF43F1F959E-0C9B2E?email=john@doe.com&token=1234" }
  
  before(:each) do
    FakeWeb.register_uri(:get, url, :body => File.open(File.expand_path(File.dirname(__FILE__) + '/support/return.xml')).read)
    
    PagseguroCatcher.configure do |config|
      config.token = "1234"
      config.email = "john@doe.com"
      config.url   = "https://ws.pagseguro.uol.com.br/v2/transactions/notifications"
    end
  end
  
  # Processing PaymentGatewaysController#pagseguro (for 186.234.16.8 at 2011-10-03 15:12:37) [POST]
   # Parameters: {"action"=>"pagseguro", "notificationCode"=>"B7CEC7-4521D221D2EC-CFF43F1F959E-0C9B2E", "notificationType"=>"transaction", "controller"=>"payment_gateways"}

  describe ".initialize" do
    it "assigns the code and type" do
      code = "B7CEC7-4521D221D2EC-CFF43F1F959E-0C9B2E"
      type = "transaction"
      
      checker = PagseguroCatcher::Checker.new(code, type)
      checker.code.should == code
      checker.type.should == type
    end
  end
  
  describe "#check" do
    it "creates a Transaction from the Pagseguro server response" do
      checker.check.should be_a(PagseguroCatcher::Transaction::Base)
    end
    
    it "assigns the response with the Pagseguro server response" do
      checker.check
      checker.response.should be_a(String)
    end
    
    it "overwrites the response if force is true" do
      checker.response = "<transaction></transaction>"
      checker.check
      checker.response.should == "<transaction></transaction>"
      
      checker.check(true)
      checker.response.should_not == "<transaction></transaction>"
    end
  end
  
  describe "#url" do
    it "uses the specific url with the params on PagseguroCatcher module" do
      checker.send(:url).should == url
    end
  end
  
end
