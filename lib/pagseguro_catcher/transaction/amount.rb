module PagseguroCatcher
  module Transaction
    
    class Amount
      attr_accessor :body
      
      def initialize(body)
        self.body = body
      end
      
      def gross
        self.body[:grossAmount].to_f
      end
      
      def discount
        self.body[:discountAmount].to_f
      end
      
      def fee
        self.body[:feeAmount].to_f
      end
      
      def net
        self.body[:netAmount].to_f
      end
      
      def extra
        self.body[:extraAmount].to_f
      end
      
    end
    
  end
end