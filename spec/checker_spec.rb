require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'fakeweb'

describe "Checker" do
  
  let(:notification_code) { "B7CEC7-4521D221D2EC-CFF43F1F959E-0C9B2E" }
  let(:receiver) { PagseguroCatcher::Receiver.new(notification_code, "transaction") }
  let(:checker)  { PagseguroCatcher::Checker.new(receiver) }
  let(:url) { "https://ws.pagseguro.uol.com.br/v2/transactions/notifications/B7CEC7-4521D221D2EC-CFF43F1F959E-0C9B2E?email=john@doe.com&token=1234" }
  
  before(:each) do
    FakeWeb.register_uri(:get, url, :body => File.open(File.expand_path(File.dirname(__FILE__) + '/support/return.xml')).read)
    
    PagseguroCatcher.configure do |config|
      config.token = "1234"
      config.email = "john@doe.com"
      config.url   = "https://ws.pagseguro.uol.com.br/v2/transactions/notifications"
    end
  end
  
  describe ".initialize" do
    it "assigns a receiver" do
      checker.receiver.should == receiver
    end
  end
  
  describe "#check" do
    it "creates a Parser from the Pagseguro server response" do
      checker.check.should be_a(PagseguroCatcher::Parser)
    end
    
    it "assigns the response as hash with the Pagseguro server response" do
      checker.check
      checker.response.should be_a(Hash)
      checker.response[:transaction].should be_true
    end
    
    it "overwrites the response if force is true" do
      checker.response = { :foo => :bar }
      checker.check
      checker.response.should == { :foo => :bar }
      
      checker.check(true)
      checker.response.should_not == { :foo => :bar }
    end
  end
  
  describe "#url" do
    it "uses the specific url with the params on PagseguroCatcher module" do
      checker.send(:url).should == url
    end
  end
  
end
