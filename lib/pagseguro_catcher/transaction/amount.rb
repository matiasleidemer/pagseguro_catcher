module PagseguroCatcher
  module Transaction
    
    class Amount < Transaction::Body
      
      def initialize(body)
        self.body = body
      end
      
      def gross
        self[:grossAmount].to_f
      end
      
      def discount
        self[:discountAmount].to_f
      end
      
      def fee
        self[:feeAmount].to_f
      end
      
      def net
        self[:netAmount].to_f
      end
      
      def extra
        self[:extraAmount].to_f
      end
      
    end
    
  end
end