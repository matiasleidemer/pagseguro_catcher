require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Item" do
  
  let(:xml)         { File.open(File.expand_path(File.dirname(__FILE__) + '/../support/return.xml')).read }
  let(:transaction) { PagseguroCatcher::Transaction::Base.new(xml) }
  let(:item)        { PagseguroCatcher::Transaction::Item.new(transaction[:items][:item].first) }
  
  describe ".initialize" do
    it "assigns the body" do
      item.body.should be_a(Hash)
    end
  end
  
  describe "#amount" do
    it "returns the amount as a float" do
      item.amount.should == 24300.00
    end
  end
      
end
