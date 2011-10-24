module PagseguroCatcher
  module Transaction
    
    class Shipping < Transaction::Body
      
      def initialize(body)
        self.body = body[:shipping]
      end
      
      def zip
        self[:address][:postalCode]
      end
      
      def human_type
        SHIPPING_TYPES[self[:type].to_i]
      end
      
      def cost
        self[:cost].to_f
      end
      
      def method_missing(name, *args)
        return self[:address][name] if self.body[:address].has_key?(name.to_sym)
        super
      end

    end
    
  end
end