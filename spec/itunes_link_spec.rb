require 'spec_helper'
require 'itunes-affiliate'

describe ItunesAffiliate::ItunesLink do
  include TestHelpers
  
  RawLinkWithoutQuestionMark = "http://itunes.apple.com/app/swine-flu-detector/id295517288"
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
  
  
  context "when using an itunes link with parameter" do
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
  
  context "when using an itunes link withOUT parameter" do
    before(:each) do
      @link = ItunesAffiliate::ItunesLink.new  RawLinkWithoutQuestionMark
    end

    it "should create a valid linkshare link" do
      params = link_to_hash  @link.affiliate_link(:linkshare)
            
      params['siteID'].should == LinkShareAffiliateCode
      params['partnerId'].should == '30'
    end

    it "should create a valid linkshare japan link" do
      params = link_to_hash  @link.affiliate_link(:linkshare_japan)
            
      params['siteID'].should == LinkShareJapanAffiliateCode
      params['partnerId'].should == '30'
    end
    
    it "should create a valid tradedoubler link" do
      params = link_to_hash  @link.affiliate_link(:tradedoubler)
            
      params['tduid'].should == TradeDoublerAffiliateCode
      params['partnerId'].should == '2003'
    end

    it "should create a valid dgm link" do
      params = link_to_hash  @link.affiliate_link(:dgm)
            
      params['affToken'].should == DGMAffiliateCode
      params['partnerId'].should == '1002'
    end
  end
  
  context "when converting through the class method" do
    before(:each) do
    end

    it "should pass nil values along" do
      res = ItunesAffiliate.affiliate_link(nil,:linkshare)
      res.should be_nil
    end

    it "should pass empty values along" do
      res = ItunesAffiliate.affiliate_link('',:linkshare)
      res.should == ''
    end
    
    it "should pass random urls along" do
      res = ItunesAffiliate.affiliate_link("http://latimes.com",:linkshare)
      res.should == "http://latimes.com"
    end
    
    it "should convert itunes urls" do
      params = link_to_hash ItunesAffiliate.affiliate_link(RawLinkWithoutQuestionMark,:linkshare)
      params['siteID'].should == LinkShareAffiliateCode
      params['partnerId'].should == '30'
    end
  end

  context "testing urls" do
    it "should recognize nil as not an itunes url" do
      ItunesAffiliate::ItunesLink.is_valid_link?(nil).should be(false)
    end

    it "should recognize empty as not an itunes url" do
      ItunesAffiliate::ItunesLink.is_valid_link?("").should be(false)
    end

    it "should recognize http://latimes.com as not an itunes url" do
      ItunesAffiliate::ItunesLink.is_valid_link?("http://latimes.com").should be(false)
    end
    

    it "should recognize a valid itunes url." do
      ItunesAffiliate::ItunesLink.is_valid_link?(RawLinkWithoutQuestionMark).should be(true)
      ItunesAffiliate::ItunesLink.is_valid_link?(RawLinkWithQuestionMark).should be(true)
    end
    
  end
  # Missing specs:
  # Must raise ArgumentException if invalid affiliate link
  # Must raise ArgumentException if no link is passed
  # check invalid url
  # check no params -> make sure url is correct
  # check that the source url is still present
  # select code based on language
end