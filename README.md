## itunes-affiliate


[![Build Status](http://travis-ci.org/freshfugu/itunes-affiliate.png)](http://travis-ci.org/freshfugu/itunes-affiliate)

## Install

Include this in your gemfile

gem 'itunes-affiliate'

## Use
A more detailed description can be found at <http://rubydoc.info/gems/itunes-affiliate>.

###Some Sample Code
		link = ItunesLink.new("http://itunes.apple.com/app/swine-flu-detector/id295517288?uo=5")
		
		puts link.affiliate_link(:linkshare)

### Config

### Notes

## Dependencies

## Acknowledgments

## Trivia

This gem was created to the tunes of Natalia Kills and Nicki Minaj.

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

