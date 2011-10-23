module PagseguroCatcher
  module Transaction
    
    class Shipping < Transaction::Body
      
      def initialize(body)
        self.body = body
      end
      
    end
    
  end
end