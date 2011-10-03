# https://pagseguro.uol.com.br/integracao/notificacao-de-transacoes.jhtml
# https://pagseguro.uol.com.br/v2/guia-de-integracao/api-de-notificacoes.html

require "pagseguro_catcher/core_ext/Hash"

module PagseguroCatcher
  autoload :Receiver, 'pagseguro_catcher/receiver'
  autoload :Checker, 'pagseguro_catcher/checker'
  autoload :Parser, 'pagseguro_catcher/parser'
  
  class << self
    attr_accessor :token, :email, :url
    
    def configure
      yield self
    end
  end
  
end