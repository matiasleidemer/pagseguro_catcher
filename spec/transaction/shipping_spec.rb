require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Shipping" do
  
  let(:xml)         { File.open(File.expand_path(File.dirname(__FILE__) + '/../support/return.xml')).read }
  let(:transaction) { PagseguroCatcher::Transaction::Base.new(xml) }
  let(:shipping)    { PagseguroCatcher::Transaction::Shipping.new(transaction.body) }
  
  describe ".initialize" do
    it "assigns the body" do
      shipping.body.should be_a(Hash)
    end
  end
  
  describe "#zip" do
    it "return the zip code" do
      shipping.zip.should == "01452002"
    end
  end
  
  describe "#street" do
    it "returns the street name" do
      shipping.street.should == "Av. Brig. Faria Lima"
    end
  end
  
  describe "#number" do
    it "returns the street number" do
      shipping.number.should == "1384"
    end
  end
  
  describe "#complement" do
    it "returns the address complement" do
      shipping.complement.should == "5o andar"
    end
  end
  
  describe "#district" do
    it "returns the district" do
      shipping.district.should == "Jardim Paulistano"
    end
  end
  
  describe "#city" do
    it "returns the city" do
      shipping.city.should == "Sao Paulo"
    end
  end
  
  describe "#state" do
    it "returns the state" do
      shipping.state.should == "SP"
    end
  end
  
  describe "#country" do
    it "returns the country code" do
      shipping.country.should == "BRA"
    end
  end
  
  describe "#human_type" do
    it "returns the human value for type" do
      shipping.human_type.should == "Encomenda normal (PAC)"
    end
  end
  
  describe "#cost" do
    it "returns the cost as float" do
      shipping.cost.should == 21.50
    end
  end
  
end
