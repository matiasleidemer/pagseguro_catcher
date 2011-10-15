module PagseguroCatcher
  module Transaction
    autoload :Base, 'pagseguro_catcher/transaction/base'
    autoload :Amount, 'pagseguro_catcher/transaction/amount'
    autoload :Sender, 'pagseguro_catcher/transaction/sender'
  end
end