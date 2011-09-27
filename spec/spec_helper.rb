require 'rubygems'
require 'bundler/setup'
$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rspec'
require 'itunes-affiliate'
require 'uri'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

module TestHelpers
  
  def link_to_hash(link)
    res = URI.parse link
     res = res.query.split '&'
     
    params = {}
    res.each {|x| y = x.split("=");params[ y[0]] = y[1] }
     
    params
  end
end

RSpec.configure do |config|
  config.color_enabled = true
end



