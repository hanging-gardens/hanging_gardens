# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "hanging_gardens/version"

Gem::Specification.new do |s|
  s.name        = "hanging_gardens"
  s.version     = HangingGardens::VERSION
  s.authors     = ["Simon Menke"]
  s.email       = ["simon.menke@gmail.com"]
  s.homepage    = "https://github.com/hanging-gardens"
  s.summary     = %q{Hanging Gardens - CommonJS for Sprockets}
  s.description = %q{Hanging Gardens - CommonJS for Sprockets}

  s.rubyforge_project = "hanging_gardens"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_runtime_dependency "sprockets"
end
