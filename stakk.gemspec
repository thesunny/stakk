# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "stakk/version"

Gem::Specification.new do |s|
  s.name        = "stakk"
  s.version     = Stakk::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Sunny Hirai"]
  s.email       = ["thesunny@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Easy and performant way to access the parts of the caller stack}
  s.description = %q{Easy and performant way to access the parts of the caller stack}

  s.rubyforge_project = "stakk"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
