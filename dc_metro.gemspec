# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "dc_metro/version"

Gem::Specification.new do |spec|
  spec.name        = "dc_metro"
  spec.version     = DcMetro::VERSION
  spec.authors     = ["Brian Tennity"]
  spec.email       = ["bt6453@gmail.com"]
  spec.description = "A Ruby gem to access WMATA's API"
  spec.summary     = spec.description
  spec.homepage    = "https://github.com/bt6453/dc_metro"
  spec.license     = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday"
  spec.add_dependency "faraday_middleware"
  spec.add_dependency "retryable"
  spec.add_dependency "activesupport"
  spec.add_development_dependency "dotenv"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "rake"
end
