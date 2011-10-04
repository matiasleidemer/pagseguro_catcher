require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Amount" do
  
  let(:xml)     { File.open(File.expand_path(File.dirname(__FILE__) + '/../support/return.xml')).read }
  let(:parser)  { PagseguroCatcher::Parser::Base.new(xml) }
  let(:amount)  { PagseguroCatcher::Parser::Amount.new(parser.body) }
  
  describe ".initialize" do
    it "assigns the body" do
      amount.body.should be_a(Hash)
    end
  end
  
  describe "#gross" do
    it "returns the gross amount as a float" do
      amount.body[:grossAmount] = "49900.00"
      amount.gross.should == 49900.00
    end
  end
  
  describe "#discount" do
    it "returns the discount amount as a float" do
      amount.body[:discountAmount] = "900.00"
      amount.discount.should == 900.00
    end
  end
  
  describe "#fee" do
    it "returns the fee amount as a float" do
      amount.body[:feeAmount] = "150.00"
      amount.fee.should == 150.00
    end
  end

  describe "#net" do
    it "returns the net amount as a float" do
      amount.body[:netAmount] = "160.00"
      amount.net.should == 160.00
    end
  end
  
  describe "#extra" do
    it "returns the extra amount as a float" do
      amount.body[:extraAmount] = "170.00"
      amount.extra.should == 170.00
    end
  end

  
end
