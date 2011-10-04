# encoding: utf-8
module PagseguroCatcher
  module Transaction
    autoload :Base, 'pagseguro_catcher/transaction/base'
    autoload :Amount, 'pagseguro_catcher/transaction/amount'
  end
end