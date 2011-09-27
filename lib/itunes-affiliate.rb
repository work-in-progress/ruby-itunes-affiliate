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

  end  
end
