module PagseguroCatcher
  module Transaction
    
    class Item < Transaction::Body
      
      def initialize(body)
        self.body = body
      end
      
      def amount
        self[:amount].to_f
      end
    end
    
  end
end