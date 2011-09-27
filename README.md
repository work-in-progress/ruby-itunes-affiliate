## itunes-affiliate
A simple gem that helps with the creation of itunes links, especially when dealing with EPF data. This is a work in progress, first version is really just to have the minimal use case working. 

Feature requests are welcome.

If you use it please test against your affiliate id and provide feedback. Use at your own risk.

[![Build Status](http://travis-ci.org/freshfugu/itunes-affiliate.png)](http://travis-ci.org/freshfugu/itunes-affiliate)

## Install

Include this in your gemfile

gem 'itunes-affiliate'

## Configure
Create an initializer if you use rails in config/initializers named itunes_affiliate.rb and add the following code snippet with your keys. If a key is not present it will be ignored.

ItunesAffiliate.configure do |config|
    config.linkshare_key = '<LINKSHARE_KEY>'
    config.linkshare_japan_key = '<LINKSHARE_JAPAN_KEY>'
    config.tradedoubler_key = '<TRADEDOUBLE_KEY>'
    config.dgm_key = '<DGM_KEY>'
end

## Use
A more detailed description can be found at <http://rubydoc.info/gems/itunes-affiliate>.

###Some Sample Code
		link = ItunesLink.new("http://itunes.apple.com/app/swine-flu-detector/id295517288?uo=5")
		
		puts link.affiliate_link(:linkshare)


## Dependencies

## Acknowledgments

## Trivia

This gem was created to the tunes of Nicki Minaj and Jennifer Lopez.

## Build

rake build
rake install
rake release
## Release Notes

### 0.0.1
* First version

## Contributing to itunes-affiliate
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

== Copyright

Copyright (c) 2011 Martin Wawrusch. See LICENSE for
further details.

