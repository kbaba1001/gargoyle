# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gargoyle/version'

Gem::Specification.new do |spec|
  spec.name          = "gargoyle"
  spec.version       = Gargoyle::VERSION
  spec.authors       = ["kbaba1001"]
  spec.email         = ["kbaba1001@users.noreply.github.com"]

  spec.summary       = "simple authentication"
  spec.description   = "simple authentication"
  spec.homepage      = "https://github.com/kbaba1001/gargoyle"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'rails'
  spec.add_dependency 'bcrypt'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'test-unit'
end
