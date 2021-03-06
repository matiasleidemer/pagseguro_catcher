module PagseguroCatcher
  module Transaction
    
    class Body
      attr_accessor :body
      
      def [](param)
        self.body[param.to_sym]
      end
      
      def method_missing(name, *args)
        return self[name] if self.body.has_key?(name.to_sym)
        super
      end
      
    end
    
    autoload :Base, 'pagseguro_catcher/transaction/base'
    autoload :Amount, 'pagseguro_catcher/transaction/amount'
    autoload :Sender, 'pagseguro_catcher/transaction/sender'
    autoload :Item, 'pagseguro_catcher/transaction/item'
    autoload :Shipping, 'pagseguro_catcher/transaction/shipping'
  end
end