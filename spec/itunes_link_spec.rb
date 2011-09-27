require 'spec_helper'
require 'itunes-affiliate'

describe ItunesAffiliate::ItunesLink do
  include TestHelpers
  
  RawLinkWithQuestionMark = "http://itunes.apple.com/app/swine-flu-detector/id295517288?uo=5"
  LinkShareAffiliateCode= "Zi7WWVQYf4o"
  LinkShareJapanAffiliateCode = "5635445dsf"
  TradeDoublerAffiliateCode = 'fdsewr3sd'
  DGMAffiliateCode = 'ewfsdd'
  
  before(:all) do
    ItunesAffiliate.configure do  |config|
      config.linkshare_key = LinkShareAffiliateCode
      config.linkshare_japan_key =LinkShareJapanAffiliateCode
      config.tradedoubler_key =TradeDoublerAffiliateCode
      config.dgm_key =DGMAffiliateCode
    end
  end
  
  
  context "when using an itunes link" do
    before(:each) do
      @link = ItunesAffiliate::ItunesLink.new  RawLinkWithQuestionMark
    end

    it "should create a valid linkshare link" do
      params = link_to_hash  @link.affiliate_link(:linkshare)
            
      params['siteID'].should == LinkShareAffiliateCode
      params['partnerId'].should == '30'
      params['uo'].should == '5'
    end

    it "should create a valid linkshare japan link" do
      params = link_to_hash  @link.affiliate_link(:linkshare_japan)
            
      params['siteID'].should == LinkShareJapanAffiliateCode
      params['partnerId'].should == '30'
      params['uo'].should == '5'
    end
    
    it "should create a valid tradedoubler link" do
      params = link_to_hash  @link.affiliate_link(:tradedoubler)
            
      params['tduid'].should == TradeDoublerAffiliateCode
      params['partnerId'].should == '2003'
      params['uo'].should == '5'
    end

    it "should create a valid dgm link" do
      params = link_to_hash  @link.affiliate_link(:dgm)
            
      params['affToken'].should == DGMAffiliateCode
      params['partnerId'].should == '1002'
      params['uo'].should == '5'
    end
    
    
  end
  
  # Missing specs:
  # Must raise ArgumentException if invalid affiliate link
  # Must raise ArgumentException if no link is passed
end