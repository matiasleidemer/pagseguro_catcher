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
      
      def sender
        @sender ||= PagseguroCatcher::Transaction::Sender.new(self.body)
        @sender
      end
      
      def [](param)
        self.body[param.to_sym]
      end
      
      def date
        self[:date].to_datetime.change(:offset => "-0300")
      end
      
      def last_event_date
        self[:lastEventDate].to_datetime.change(:offset => "-0300")
      end
      
      def transaction_type
        TRANSACTION_TYPES[self[:type].to_i]
      end

      def transaction_status
        TRANSACTION_STATUS[self[:status].to_i]
      end

      def payment_method_type
        PAYMENT_TYPES[self[:paymentMethod][:type].to_i]
      end

      def payment_method_code
        PAYMENT_CODES[self[:paymentMethod][:code].to_i]
      end
      
      def method_missing(name, *args)
        return self[name.to_sym] if self.body.has_key?(name.to_sym)
        super
      end
      
      #TODO - items, shipping
      
    end
    
  end
end