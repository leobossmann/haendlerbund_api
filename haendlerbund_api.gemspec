# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'haendlerbund_api/version'

Gem::Specification.new do |spec|
  spec.name          = "haendlerbund_api"
  spec.version       = HaendlerbundApi::VERSION
  spec.authors       = ["Leo Bossmann"]
  spec.email         = ["leo@noni-mode.de"]
  spec.description   = "Ruby gem to access the Händlerbund API"
  spec.summary       = "Access the Händlerbund API to retrieve up-to-date (German) legal documents for your online shop"
  spec.homepage      = "https://github.com/leobossmann/haendlerbund_api"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "pry"
end
