# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stringed/version'

Gem::Specification.new do |gem|
  gem.name          = "stringed"
  gem.version       = Stringed::VERSION
  gem.authors       = ["andrewthomascampbell@gmail.com"]
  gem.email         = ["andrewthomascampbell.com"]
  gem.description   = %q{A library for Stringed instruments.}
  gem.summary       = %q{Recognizes chords and notes for any stringed instrument.}
  gem.homepage      = "https://github.com/andycamp/stringed"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency 'music', '~> 0.6'
  gem.add_development_dependency 'rspec', '~> 2.0'
end
