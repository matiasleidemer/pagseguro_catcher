# encoding: utf-8
module PagseguroCatcher
  class Parser
    attr_accessor :body
    
    TRANSACTION_TYPES  = { 1 => "Pagamento", 2 => "Transferência", 3 => "Adição de fundos", 4 => "Cobrança", 5 => "Bônus" }
    TRANSACTION_STATUS = { 1 => "Aguardando pagamento", 2 => "Em análise", 3 => "Paga", 4 => "Disponível", 5 => "Em disputa", 6 => "Devolvida", 7 => "Cancelada" }

    def initialize(xml)
      self.body = Hash.from_xml(xml)["transaction"]
      self.body.recursive_symbolize_keys! if self.body
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
    
  end
end