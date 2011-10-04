module PagseguroCatcher
  module Transaction
    
    class Base
      attr_accessor :body

      def initialize(xml)
        self.body = Hash.from_xml(xml)["transaction"]
        self.body.recursive_symbolize_keys! if self.body
      end
      
      def amount
        @amount ||= PagseguroCatcher::Transaction::Amount.new(self.body)
        @amount
      end
      
      def date
        self.body[:date].to_datetime.change(:offset => "-0300")
      end

      def transaction_type
        TRANSACTION_TYPES[self.body[:type].to_i]
      end

      def transaction_status
        TRANSACTION_STATUS[self.body[:status].to_i]
      end

      def payment_method_type
        PAYMENT_TYPES[self.body[:paymentMethod][:type].to_i]
      end

      def payment_method_code
        PAYMENT_CODES[self.body[:paymentMethod][:code].to_i]
      end
            
    end
    
  end
end