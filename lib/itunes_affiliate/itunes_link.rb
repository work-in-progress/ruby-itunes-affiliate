module ItunesAffiliate
  class ItunesLink

    Partners =  [:linkshare,:linkshare_japan,:tradedoubler,:dgm].freeze
     
    def initialize(source_link)
      raise ArgumentException "You need to provide a source link" if source_link == nil
      @source_link = source_link
    end

    def affiliate_link(partner)
  
      "#{@source_link}&partnerId=30&siteID=#{ItunesAffiliate.config.linkshare_key}"
    end

  end
end