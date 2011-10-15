require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Amount" do
  
  let(:xml)         { File.open(File.expand_path(File.dirname(__FILE__) + '/../support/return.xml')).read }
  let(:transaction) { PagseguroCatcher::Transaction::Base.new(xml) }
  let(:amount)      { PagseguroCatcher::Transaction::Amount.new(transaction.body) }
  
  describe ".initialize" do
    it "assigns the body" do
      amount.body.should be_a(Hash)
    end
  end
  
  describe "#gross" do
    it "returns the gross amount as a float" do
      amount.gross.should == 49900.00
    end
  end
  
  describe "#discount" do
    it "returns the discount amount as a float" do
      amount.discount.should == 0.00
    end
  end
  
  describe "#fee" do
    it "returns the fee amount as a float" do
      amount.fee.should == 0.00
    end
  end

  describe "#net" do
    it "returns the net amount as a float" do
      amount.net.should == 49900.00
    end
  end
  
  describe "#extra" do
    it "returns the extra amount as a float" do
      amount.extra.should == 0.00
    end
  end
  
end
