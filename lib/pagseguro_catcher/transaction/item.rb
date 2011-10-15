module PagseguroCatcher
  module Transaction
    
    class Item < Transaction::Body
      
      def initialize(body)
        self.body = body[:sender]
      end
      
    end
    
  end
end