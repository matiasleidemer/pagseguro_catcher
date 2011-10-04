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
  
  describe "#date" do
    it "returns the date response as a DateTime object" do
      transaction.body[:date] = "2011-02-10T16:13:41.000-03:00"
      transaction.date.should == DateTime.new(2011, 02, 10, 16, 13, 41, "-03:00")
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
    it "return the human value for the payment method" do
      transaction.body[:paymentMethod][:type] = "1"
      transaction.payment_method_type.should == "Cartão de crédito"
    end
  end
  
  describe "#payment_method_code" do
    it "return the human value for the payment method" do
      transaction.body[:paymentMethod][:code] = "101"
      transaction.payment_method_code.should == "Cartão de crédito Visa"
    end
  end
  
end
