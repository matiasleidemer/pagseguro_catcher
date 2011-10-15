# -*- encoding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Sender" do
  
  let(:xml)         { File.open(File.expand_path(File.dirname(__FILE__) + '/../support/return.xml')).read }
  let(:transaction) { PagseguroCatcher::Transaction::Base.new(xml) }
  let(:sender)      { PagseguroCatcher::Transaction::Sender.new(transaction.body) }
  
  describe ".initialize" do
    it "assigns the body" do
      sender.body.should be_a(Hash)
    end
  end
  
  describe "#name" do
    it "returns the senders name" do
      sender.name.should eql "José Comprador"
    end
  end

  describe "#email" do
    it "returns the senders email" do
      sender.email.should eql "comprador@uol.com.br"
    end
  end
  
  describe "#phone" do
    it "returns the senders phone" do
      phone = sender.phone
      phone.should == { :area => "11", :number => "56273440" }
    end
  end
  
  
end
