# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hangman/version'

Gem::Specification.new do |spec|
  spec.name          = 'hangman_strategy'
  spec.version       = Hangman::VERSION
  spec.authors       = ['Igor Pstyga']
  spec.email         = ['igor.pstyga@gmail.com']
  spec.description   = %q{Guessing strategy for Hangman game}
  spec.summary       = %q{Guessing strategy for Hangman game}
  spec.homepage      = 'https://github.com/opti/hangman_strategy'
  spec.license       = 'MIT'

  spec.bindir        = 'bin'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'minitest', '~> 5.2'
end
