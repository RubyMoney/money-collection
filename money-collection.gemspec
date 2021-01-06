# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'money/collection/version'

Gem::Specification.new do |spec|
  spec.name          = "money-collection"
  spec.version       = Money::Collection::VERSION
  spec.authors       = ["lulalala"]
  spec.email         = ["mark@goodlife.tw"]
  spec.summary       = %q{Optimized operation on collection of Money objects}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/lulalala/money-collection"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "money", "~> 6.3"

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.14"
end
