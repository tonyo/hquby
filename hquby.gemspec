# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hquby/version'

Gem::Specification.new do |gem|
  gem.name          = "hquby"
  gem.version       = Hquby::VERSION
  gem.authors       = ["Anton Ovchinnikov"]
  gem.email         = ["revolver112@gmail.com"]
  gem.description   = %q{HQ9+ interpreter}
  gem.summary       = %q{Simple HQ9+ implementation}
  gem.homepage      = "git://github.com/rev112/hquby"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
