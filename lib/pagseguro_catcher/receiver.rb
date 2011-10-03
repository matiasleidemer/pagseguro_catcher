module PagseguroCatcher
  class Receiver
    attr_accessor :code, :type
    
    def initialize(code, type)
      self.code = code
      self.type = type
    end
    
  end
end