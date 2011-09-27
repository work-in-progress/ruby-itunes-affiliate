require 'spec_helper'
require 'itunes-affiliate'

describe Itunes::Affiliate::ItunesLink do
  before(:each) do
  end
  
  RawLinkWithQuestionMark = "http://itunes.apple.com/app/swine-flu-detector/id295517288?uo=5"
  LinkShareAffiliateCode= "Zi7WWVQYf4o"
  
  context "when using an itunes link" do
    before(:each) do
      @link = Itunes::Affiliate::ItunesLink.new  RawLinkWithQuestionMark
    end

    it "should create a valid link share link" do
      @link.affiliate_link(:linkshare).should == "#{RawLinkWithQuestionMark}&siteID=#{LinkShareAffiliateCode}&partnerId=30"
    end
  end
  
end