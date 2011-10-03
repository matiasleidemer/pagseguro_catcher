module PagseguroCatcher
  class Parser
    attr_accessor :body
    
    def initialize(xml)
      self.body = xml
    end
    
  end
end