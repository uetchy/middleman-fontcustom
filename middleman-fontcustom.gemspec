# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "middleman-fontcustom/version"

Gem::Specification.new do |s|
  s.name        = "middleman-fontcustom"
  s.version     = Middleman::Fontcustom::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Yasuaki Uechi"]
  s.email       = ["uetchy@randompaper.co"]
  s.homepage    = "https://github.com/uetchy/middleman-fontcustom"
  s.summary     = %q{Generate web-fonts in your Middleman project}
  s.description = %q{Generate web-fonts in your Middleman project}
  s.license     = "MIT"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]

  s.required_ruby_version = ">= 1.9.3"

  s.add_runtime_dependency "middleman-core", "~> 3.3", ">= 3.3.7"
  s.add_runtime_dependency "fontcustom", "~> 1.3.7"

  s.add_development_dependency "rake"
end
