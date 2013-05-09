require "itunes_affiliate/version"
require "itunes_affiliate/configuration"
require "itunes_affiliate/itunes_link"

# @author Martin Wawrusch
#
# A simple gem that helps with the creation of itunes links, especially when dealing with EPF data.
#
# @example Configuring the keys (in config/initializers/itunes_affiliate.rb)
#   ItunesAffiliate.configure do |config|
#    config.linkshare_key = '<LINKSHARE_KEY>'
#    config.linkshare_japan_key = '<LINKSHARE_JAPAN_KEY>'
#    config.tradedoubler_key = '<TRADEDOUBLE_KEY>'
#    config.dgm_key = '<DGM_KEY>'
#   end
#
# 
# @example Add affiliate information to a link and ignore invalid links
#   link = ItunesAffiliate.affiliate_link("http://itunes.apple.com/app/swine-flu-detector/id295517288",:linkshare)
# 
module ItunesAffiliate

  class << self
    attr_accessor :config

    # Invoked with blog to configure this gem. 
    # Pass a block with |config| and set the keys
    def configure()
      yield(config)
    end

    # Access the configuration object
    # @return [Configuration] the configuration object singleton.
    def config
      unless @config
        @config = Configuration.new
        @config.reset
      end
      
      @config 
    end

    # Return an affiliate link for a given clean itunes url 
    # @param [String] link the link to which to add the affiliate information.
    # @param [Symbol] partner the partner, as determined by the store. Valid values are :linkshare,:linkshare_japan,:tradedoubler,:dgm
    # @return [String] a modified link containing the affiliate information, or the original link if the link is not an itunes clean link.
    def affiliate_link(link,partner)
      return link unless ItunesAffiliate::ItunesLink.is_valid_link?(link)
      
      ItunesAffiliate::ItunesLink.new(link).affiliate_link(partner)
    end
  end  
end
