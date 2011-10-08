# encoding: utf-8
module PagseguroCatcher
  #maybe YML?... this doesn't seem right...
  
  TRANSACTION_TYPES  = { 
    1 => "Pagamento", 
    2 => "Transferência", 
    3 => "Adição de fundos", 
    4 => "Cobrança", 
    5 => "Bônus" 
  }
  
  TRANSACTION_STATUS = { 
    1 => "Aguardando pagamento", 
    2 => "Em análise", 
    3 => "Paga", 
    4 => "Disponível", 
    5 => "Em disputa", 
    6 => "Devolvida", 
    7 => "Cancelada" 
  }
  
  PAYMENT_TYPES = { 
    1 => "Cartão de crédito", 
    2 => "Boleto", 
    3 => "Débito online (TEF)", 
    4 => "Saldo PagSeguro", 
    5 => "Oi Paggo" 
  }
  
  PAYMENT_CODES = { 
    101	=> "Cartão de crédito Visa", 
    102	=> "Cartão de crédito MasterCard",
    103	=> "Cartão de crédito American Express",
    104	=> "Cartão de crédito Diners",
    105	=> "Cartão de crédito Hipercard",
    106	=> "Cartão de crédito Aura",
    107	=> "Cartão de crédito Elo",
    201	=> "Boleto Bradesco", 
    202	=> "Boleto Santander", 
    301	=> "Débito online Bradesco",
    302	=> "Débito online Itaú",
    303	=> "Débito online Unibanco",
    304	=> "Débito online Banco do Brasil",
    305	=> "Débito online Banco Real",
    306	=> "Débito online Banrisul",
    401	=> "Saldo PagSeguro",
    501	=> "Oi Paggo"
  }
  
end