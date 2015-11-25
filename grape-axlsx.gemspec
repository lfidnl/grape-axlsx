# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grape/axlsx/version'

Gem::Specification.new do |spec|
  spec.name          = "grape-axlsx"
  spec.version       = Grape::Axlsx::VERSION
  spec.authors       = ["Ivan Kabluchkov"]
  spec.email         = ["ikabluchkov@gmail.com"]

  spec.summary       = %q{Use Axlsx in Grape}
  spec.description   = %q{Simple implementation for using Axlsx templates in Grape.}
  spec.homepage      = "https://github.com/lfidnl/grape-axlsx"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_dependency "grape", ">= 0.3"
  spec.add_dependency "axlsx"

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
