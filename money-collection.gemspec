# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "money/collection/version"

Gem::Specification.new do |s|
  s.name        = "money-collection"
  s.version     = Money::Collection::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["lulalala"]
  s.email       = ["mark@goodlife.tw"]
  s.homepage    = "https://github.com/RubyMoney/money-collection"
  s.summary     = "Optimized operation on collection of Money objects"
  s.description = "Optimized operation on collection of Money objects"
  s.license     = "MIT"

  s.add_dependency "money", "~> 7.0"

  s.files         = `git ls-files -z -- lib/* CHANGELOG.md LICENSE money-collection.gemspec README.md`.split("\x0")
  s.require_paths = ["lib"]

  if s.respond_to?(:metadata)
    s.metadata["changelog_uri"] = "https://github.com/RubyMoney/money-collection/blob/main/CHANGELOG.md"
    s.metadata["source_code_uri"] = "https://github.com/RubyMoney/money-collection/"
    s.metadata["bug_tracker_uri"] = "https://github.com/RubyMoney/money-collection/issues"
    s.metadata["rubygems_mfa_required"] = "true"
  end
end
