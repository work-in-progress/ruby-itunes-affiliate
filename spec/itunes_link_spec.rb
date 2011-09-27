require 'spec_helper'
require 'itunes-affiliate'

describe ItunesAffiliate::ItunesLink do
  include TestHelpers
  
  RawLinkWithQuestionMark = "http://itunes.apple.com/app/swine-flu-detector/id295517288?uo=5"
  LinkShareAffiliateCode= "Zi7WWVQYf4o"

  before(:all) do
    ItunesAffiliate.configure do  |config|
      config.linkshare_key = LinkShareAffiliateCode
    end
  end
  
  
  context "when using an itunes link" do
    before(:each) do
      @link = ItunesAffiliate::ItunesLink.new  RawLinkWithQuestionMark
    end

    it "should create a valid link share link" do
      params = link_to_hash  @link.affiliate_link(:linkshare)
            
      params['siteID'].should == LinkShareAffiliateCode
      params['partnerId'].should == '30'
      params['uo'].should == '5'
    end
  end
  
end