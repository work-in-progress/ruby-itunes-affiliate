# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "itunes_affiliate/version"


Gem::Specification.new do |s|
  s.name        = "itunes-affiliate"
  s.version     = ItunesAffiliate::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Martin Wawrusch"]
  s.email       = ["martin@wawrusch.com"]
  s.homepage    = "http://github.com/freshfugu/itunes-affiliate"
  s.summary     = %q{Easily add affiliate information to your itunes links.}
  s.description = %q{This gem provides you with an ItunesLink class that simplifies adding affiliate information to itunes links.}
  s.extra_rdoc_files   = ["LICENSE","README.md"]
  s.rdoc_options = ["--charset=UTF-8"]
  s.rubyforge_project = "itunes-affiliate"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
#  s.add_runtime_dependency "httparty"  
  s.add_development_dependency "rspec", "~> 2.1"
  s.add_development_dependency "rake", "~> 0.8"
  s.add_development_dependency "bundler","~> 1.0.0"
  s.post_install_message=<<eos
**********************************************************************************
  Thank you for using this gem.
  
  Follow @martin_sunset on Twitter for announcements, updates and news
  https://twitter.com/martin_sunset

  To get the source go to http://github.com/freshfugu/itunes-affiliate

**********************************************************************************    
eos
  
  
end
