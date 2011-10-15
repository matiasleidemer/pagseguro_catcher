# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Transaction" do
  
  let(:xml)         { File.open(File.expand_path(File.dirname(__FILE__) + '/../support/return.xml')).read }
  let(:transaction) { PagseguroCatcher::Transaction::Base.new(xml) }
  
  describe ".initialize" do
    it "assigns the body as Hash with the passed XML" do
      transaction.body.should be_a(Hash)
    end
  end
  
  describe "#[]" do
    it "returns the hash value of the body" do
      transaction.body[:code] = "1234"
      transaction[:code].should == "1234"
    end
  end
  
  describe "#amount" do
    it "returns an Amount object" do
      transaction.amount.should be_a(PagseguroCatcher::Transaction::Amount)
    end
  end
  
  describe "#sender" do
    it "returns an Sender object" do
      transaction.sender.should be_a(PagseguroCatcher::Transaction::Sender)
    end
  end
  
  describe "#date" do
    it "returns the date response as a DateTime object" do
      transaction.body[:date] = "2011-02-10T16:13:41.000-03:00"
      transaction.date.should == DateTime.new(2011, 02, 10, 16, 13, 41, "-03:00")
    end
  end
  
  describe "#last_event_date" do
    it "returns the last event date response as a DateTime object" do
      transaction.body[:lastEventDate] = "2011-10-04T15:48:59.000-03:00"
      transaction.last_event_date.should == DateTime.new(2011, 10, 04, 15, 48, 59, "-03:00")
    end
  end
  
  describe "#transaction_type" do
    it "returns the human value for the transaction type" do
      transaction.body[:type] = "1"
      transaction.transaction_type.should == "Pagamento"
    end
  end
  
  describe "#transaction_status" do
    it "returns the human value for the transaction status" do
      transaction.body[:status] = "3"
      transaction.transaction_status.should == "Paga"      
    end
  end
  
  describe "#payment_method_type" do
    it "returns the human value for the payment method" do
      transaction.body[:paymentMethod][:type] = "1"
      transaction.payment_method_type.should == "Cartão de crédito"
    end
  end
  
  describe "#payment_method_code" do
    it "returns the human value for the payment method" do
      transaction.body[:paymentMethod][:code] = "101"
      transaction.payment_method_code.should == "Cartão de crédito Visa"
    end
  end
  
  describe "#utf8" do
    it "returns the string in utf8" do
      pending
    end
  end
  
  describe "#method_missing" do
    it "tries to run #[] with the method name" do
      transaction.should_not respond_to :installmentCount
      transaction.installmentCount.should == "1"
    end
    
    it "raises exception if the parameter does not exist" do
      transaction.should_not respond_to :non_existant_method
      lambda { transaction.non_existant_method }.should raise_error(NoMethodError)
    end
  end
  
end
