require "itunes_affiliate/version"
require "itunes_affiliate/configuration"
require "itunes_affiliate/itunes_link"

module ItunesAffiliate

  class << self
    attr_accessor :config

    def configure()
      yield(config)
    end

    def config
      unless @config
        @config = Configuration.new
        @config.reset
      end
      @config 
    end

    def affiliate_link(link,partner)
      return link unless ItunesAffiliate::ItunesLink.is_valid_link?(link)
      
      return ItunesAffiliate::ItunesLink.new(link).affiliate_link(partner)
    end
  end  
end
