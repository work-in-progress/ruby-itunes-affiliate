require 'uri'

module ItunesAffiliate
  class ItunesLink

    Partners =  [:linkshare,:linkshare_japan,:tradedoubler,:dgm].freeze
     
    def initialize(source_link)
      raise ArgumentException "You need to provide a source link" if source_link == nil
      @source_link = source_link
    end

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