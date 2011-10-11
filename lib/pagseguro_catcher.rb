# https://pagseguro.uol.com.br/integracao/notificacao-de-transacoes.jhtml
# https://pagseguro.uol.com.br/v2/guia-de-integracao/api-de-notificacoes.html

require "active_support/core_ext"
require "pagseguro_catcher/core_ext/Hash"
require "pagseguro_catcher/constants"
require "pagseguro_catcher/transaction"

module PagseguroCatcher
  autoload :Checker, 'pagseguro_catcher/checker'
  mattr_accessor :url
  
  self.url = "https://ws.pagseguro.uol.com.br/v2/transactions/notifications"
  
  class << self
    attr_accessor :token, :email
    
    def configure
      yield self
    end
  end
  
  
  
end