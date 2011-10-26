module PagseguroCatcher
  module Transaction
    
    # This class is responsable for parsing the shipping values of the xml. 
    # 
    # The part that it parsers is the following:
    #
    #  <shipping>
    #    <address>
    #      <street>Av. Brig. Faria Lima</street>
    #      <number>1384</number>
    #      <complement>5o andar</complement>
    #      <district>Jardim Paulistano</district>
    #      <postalCode>01452002</postalCode>
    #      <city>Sao Paulo</city>
    #      <state>SP</state>
    #      <country>BRA</country>
    #    </address>
    #    <type>1</type>
    #    <cost>21.50</cost>
    #  </shipping>
    class Shipping < Transaction::Body
      
      def initialize(body)
        self.body = body[:shipping]
      end
      
      # Returns the zip number as a string
      #  shipping.zip # => "012345"
      def zip
        self[:address][:postalCode]
      end
      
      # The human readable value for the shipping type
      #  shipping.human_type # => "Encomenda normal (PAC)"
      def human_type
        SHIPPING_TYPES[self[:type].to_i]
      end
      
      # The the shipping cost as a float
      #  shipping.cost # => 21.50
      def cost
        self[:cost].to_f
      end
      
      # method_missing will try to find anything inside the address node
      #  shipping.street # => "Av. Brig. Faria Lima"
      def method_missing(name, *args)
        return self[:address][name] if self.body[:address].has_key?(name.to_sym)
        super
      end

    end
    
  end
end