module PagseguroCatcher
  module Transaction
    
    class Item < Transaction::Body
      
      def initialize(body)
        self.body = body
      end
      
      def id
        self[:id].to_i
      end
      
      def amount
        self[:amount].to_f
      end
    end
    
  end
end