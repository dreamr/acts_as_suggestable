# -*- encoding: utf-8 -*-
require File.expand_path("../lib/acts_as_suggestable/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "acts_as_suggestable"
  s.version     = ActsAsSuggestable::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = []
  s.email       = []
  s.homepage    = "http://rubygems.org/gems/acts_as_suggestable"
  s.summary     = "TODO: Write a gem summary"
  s.description = "TODO: Write a gem description"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "acts_as_suggestable"

  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "rspec", "~> 2.5"
  s.add_development_dependency "active-support", "~> 3.0"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
