# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spot/version'

Gem::Specification.new do |spec|
  spec.name          = "spot"
  spec.version       = Spot::VERSION
  spec.authors       = ["Jennifer Coryell"]
  spec.email         = ["jennifer.coryell@gmail.com"]
  spec.summary       = %q{Spotify controlled through the command line}
  spec.description   = %q{Use basic commands to control spotify without leaving your terminal.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ["spot"] 
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
