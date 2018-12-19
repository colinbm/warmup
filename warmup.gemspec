# -*- encoding: utf-8 -*-
require File.expand_path('../lib/warmup', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Colin Burn-Murdoch"]
  gem.email         = ["colin@burn-murdoch.com"]
  gem.description   = "Control Warmup Thermostats"
  gem.summary       = ""
  gem.homepage      = "http://github.com/colinbm/warmup"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "warmup"
  gem.require_paths = ["lib"]
  gem.version       = Warmup::VERSION
  gem.add_dependency 'mechanize'
end
