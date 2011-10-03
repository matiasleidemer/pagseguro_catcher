require "httparty"
require "active_support/core_ext"

module PagseguroCatcher
  class Checker
    include HTTParty
    
    attr_accessor :receiver, :response

    def initialize(receiver)
      self.receiver = receiver
    end
    
    def check(force=false)
      self.response = Hash.from_xml(HTTParty.get(url)) if force
      self.response ||= Hash.from_xml(HTTParty.get(url))
      if self.response
        self.response.recursive_symbolize_keys!
        PagseguroCatcher::Parser.new(self.response)
      end
    end
    
    private
    def url
      "#{PagseguroCatcher.url}/#{self.receiver.code}?email=#{PagseguroCatcher.email}&token=#{PagseguroCatcher.token}"
    end
    
  end
end