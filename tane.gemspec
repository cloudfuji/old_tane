# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "tane/version"

Gem::Specification.new do |s|
  s.name        = "tane"
  s.version     = Tane::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Sean Grove"]
  s.email       = ["sean@fakecoolguys.com"]
  s.homepage    = "http://bushi.do/"
  s.summary     = %q{Internal development tool for Bushido projects}
  s.description = %q{Internal development tool for Bushido projects}

  s.rubyforge_project = "tane"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
