# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mygem/version'

Gem::Specification.new do |spec|
  spec.name          = "mygem"
  spec.version       = Mygem::VERSION
  spec.authors       = ["Zohaib Sarwar"]
  spec.email         = ["zohaib.sarwar@confiz.com"]
  spec.description   = %q{Its working}
  spec.summary       = %q{its summary}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
