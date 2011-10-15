module PagseguroCatcher
  module Transaction
    
    class Sender < Transaction::Base
      
      def initialize(body)
        self.body = body[:sender]
      end
      
      def name
        utf8(self[:name])
      end
      
      def email
        self[:email]
      end
      
      def phone
        { :area => self[:phone][:areaCode], :number => self[:phone][:number] }
      end

    end
    
  end
end