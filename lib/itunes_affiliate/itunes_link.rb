require 'uri'

module ItunesAffiliate
  class ItunesLink

    # The list of possible affiliate parters, as determined by the store.
    Partners = [
      :linkshare,
      :linkshare_japan,
      :tradedoubler,
      :dgm
    ].freeze
     
    # Initializes a new instance of the ItunesLink class
    # @param [String] source_link the source link, which should be a valid clean itunes link
    # @return [ItunesLink] an initialized ItunesLink object.
    # @raise [ArgumentException] raised when source_link is nil   
    def initialize(source_link)
      raise ArgumentException "You need to provide a source link" unless source_link 
      @source_link = source_link
    end

    # Returns an affiliate link
    # @param [Symbol] partner the partner, as determined by the store. Valid values are :linkshare,:linkshare_japan,:tradedoubler,:dgm
    # @return [String] a modified link containing the affiliate information, or the original link if the link is not an itunes clean link.
    # @raise [ArgumentException] raised when the partner is not a valid symbol 
    def affiliate_link(partner)
      case partner
        when :linkshare
          append_to_link @source_link, "&partnerId=#{ItunesAffiliate.config.linkshare_partner_id}&siteID=#{ItunesAffiliate.config.linkshare_key}"
        when :linkshare_japan
          append_to_link @source_link, "&partnerId=#{ItunesAffiliate.config.linkshare_japan_partner_id}&siteID=#{ItunesAffiliate.config.linkshare_japan_key}"
        when :tradedoubler
          append_to_link @source_link, "&partnerId=#{ItunesAffiliate.config.tradedoubler_partner_id}&tduid=#{ItunesAffiliate.config.tradedoubler_key}"
        when :dgm
          append_to_link @source_link, "&partnerId=#{ItunesAffiliate.config.dgm_partner_id}&affToken=#{ItunesAffiliate.config.dgm_key}"
        else
          raise ArgumentException "Unrecognized partner #{partner} must be one of #{Partners}"
      end
    end
    
    # Determines if the link is a valid itunes clean url.
    # @param [String] link the link that should be checked.
    # @return [Boolean] true if the link is not nil and has the host itunes.apple.com, otherwise false
    def self.is_valid_link?(link)
      uri = URI.parse(link) rescue nil
      
      uri != nil && uri.host != nil && uri.host.downcase == "itunes.apple.com"
    end
    
    private 

      # A total hack, this is a good example of really bad code.
      def append_to_link(link, append_me)
        unless URI.parse(link).query 
          append_me[0] = "?"
        end 
        
        "#{link}#{append_me}"
      end

  end
end