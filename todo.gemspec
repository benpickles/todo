# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'todo/version'

Gem::Specification.new do |gem|
  gem.name          = 'todo'
  gem.version       = Todo::VERSION
  gem.authors       = ['Ben Pickles']
  gem.email         = ['spideryoung@gmail.com']
  gem.description   = 'Really simple todo lists'
  gem.summary       = 'Really simple todo lists'
  gem.homepage      = ''

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']
end
