require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "PagseguroCatcher" do
  it "yields the configuration" do
    PagseguroCatcher.configure do |config|
      config.should respond_to :token
      config.should respond_to :email
      config.should respond_to :url
    end
  end
  
  
end
