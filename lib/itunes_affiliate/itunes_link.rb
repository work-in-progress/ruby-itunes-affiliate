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
          "#{@source_link}&partnerId=#{ItunesAffiliate.config.linkshare_partner_id}&siteID=#{ItunesAffiliate.config.linkshare_key}"
        else
          raise ArgumentException "Unrecognized partner #{partner} must be one of #{Partners}"
      end
    end
  end
end