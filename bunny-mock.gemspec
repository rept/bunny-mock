#!/usr/bin/env gem build
# encoding: utf-8

require File.expand_path("../lib/bunny_mock/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = 'bunny-mock'
  s.version     = BunnyMock::VERSION.dup
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Andrew Rempe']
  s.email       = [["616e6472657772656d706540676d61696c2e636f6d"].pack("H*")]
  s.summary     = 'Mocking for the popular Bunny client for RabbitMQ'
  s.description = 'Easy to use mocking for testing the Bunny client for RabbitMQ'
  s.license     = 'MIT'

  s.required_ruby_version = Gem::Requirement.new '>= 1.9'

  # Bunny 1.7.0 is known to work with JRuby, but unsupported after that.
  # Other Ruby platforms are expected to work on any 1.7.x version or later.
  if RUBY_PLATFORM == 'java'
    s.add_dependency 'amq-protocol', '<= 1.9.2'
    s.add_dependency 'bunny', '1.7.0'
  else
    s.add_dependency 'bunny', '>= 1.7'
  end

  s.add_development_dependency 'rake', '~> 10.5.0'
  s.add_development_dependency 'rubocop', '= 0.40.0'
  s.add_development_dependency 'yard'
  s.add_development_dependency 'rspec', '~> 3.4.0'
  s.add_development_dependency 'term-ansicolor', '~> 1.3.0'
  s.add_development_dependency 'tins', '= 1.6.0'
  s.add_development_dependency 'coveralls'

  s.files         = `git ls-files`.split "\n"
  s.test_files    = `git ls-files -- spec/*`.split "\n"
  s.require_paths = [ 'lib' ]
end
