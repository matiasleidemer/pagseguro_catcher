require "httparty"

module PagseguroCatcher
  class Checker
    include HTTParty
    
    attr_accessor :code, :type, :response

    def initialize(code, type)
      self.code = code
      self.type = type
    end
    
    def check(force=false)
      self.response = HTTParty.get(url).body if force
      self.response ||= HTTParty.get(url).body
      
      if self.response
        PagseguroCatcher::Transaction::Base.new(self.response)
      end
    end
    
    private
    def url
      "#{PagseguroCatcher.url}/#{self.code}?email=#{PagseguroCatcher.email}&token=#{PagseguroCatcher.token}"
    end
    
  end
end