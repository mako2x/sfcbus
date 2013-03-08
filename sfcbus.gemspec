# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sfcbus/version'

Gem::Specification.new do |gem|
  gem.name          = 'sfcbus'
  gem.version       = SFCBus::VERSION
  gem.authors       = ['mako2x']
  gem.email         = ['arekara3nen@gmail.com']
  gem.description   = %q{Ruby gem that provides bus information at Keio Univ SFC.}
  gem.summary       = %q{Provides bus information at SFC.}
  gem.homepage      = 'https://github.com/mako2x/sfcbus'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']
  gem.add_dependency             'holidays',    '>=1.0.5'
  gem.add_dependency             'args_parser', '>=0.1.4'
  gem.add_development_dependency 'rspec'
end
