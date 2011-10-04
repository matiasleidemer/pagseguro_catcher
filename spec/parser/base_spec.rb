require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Parser" do
  
  let(:xml)     { File.open(File.expand_path(File.dirname(__FILE__) + '/../support/return.xml')).read }
  let(:parser)  { PagseguroCatcher::Parser::Base.new(xml) }
  
  describe ".initialize" do
    it "assigns the body as Hash with the passed XML" do
      parser.body.should be_a(Hash)
    end
  end
  
  describe "#date" do
    it "returns the date response as a DateTime object" do
      parser.body[:date] = "2011-02-10T16:13:41.000-03:00"
      parser.date.should == DateTime.new(2011, 02, 10, 16, 13, 41, "-03:00")
    end
  end
  
  describe "#transaction_type" do
    it "returns the human value for the transaction type" do
      parser.body[:type] = "1"
      parser.transaction_type.should == "Pagamento"
    end
  end
  
  describe "#transaction_status" do
    it "returns the human value for the transaction status" do
      parser.body[:status] = "3"
      parser.transaction_status.should == "Paga"      
    end
  end
  
  describe "#payment_method_type" do
    it "return the human value for the payment method" do
      parser.body[:paymentMethod][:type] = "1"
      parser.payment_method_type.should == "Cartão de crédito"
    end
  end
  
  describe "#payment_method_code" do
    it "return the human value for the payment method" do
      parser.body[:paymentMethod][:code] = "101"
      parser.payment_method_code.should == "Cartão de crédito Visa"
    end
  end
end
