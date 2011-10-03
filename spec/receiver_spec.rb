require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Receiver" do
  
  # Processing PaymentGatewaysController#pagseguro (for 186.234.16.8 at 2011-10-03 15:12:37) [POST]
  # Parameters: {"action"=>"pagseguro", "notificationCode"=>"B7CEC7-4521D221D2EC-CFF43F1F959E-0C9B2E", "notificationType"=>"transaction", "controller"=>"payment_gateways"}
  
  it "assigns the code and type" do
    code = "B7CEC7-4521D221D2EC-CFF43F1F959E-0C9B2E"
    type = "transaction"
    
    receiver = PagseguroCatcher::Receiver.new(code, type)
    receiver.code.should == code
    receiver.type.should == type
  end
  
  
end
