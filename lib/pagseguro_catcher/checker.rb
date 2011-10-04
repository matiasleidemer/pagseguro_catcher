require "httparty"

module PagseguroCatcher
  class Checker
    include HTTParty
    
    attr_accessor :receiver, :response

    def initialize(receiver)
      self.receiver = receiver
    end
    
    def check(force=false)
      self.response = HTTParty.get(url).body if force
      self.response ||= HTTParty.get(url).body
      if self.response
        PagseguroCatcher::Parser.new(self.response)
      end
    end
    
    private
    def url
      "#{PagseguroCatcher.url}/#{self.receiver.code}?email=#{PagseguroCatcher.email}&token=#{PagseguroCatcher.token}"
    end
    
  end
end