# frozen_string_literal: true

begin
  require "./lib/mainapp/version"
rescue LoadError
  module Mainapp; VERSION = "0"; end
end

Gem::Specification.new do |spec|
  spec.name = "mainapp"
  spec.version = Mainapp::VERSION
  spec.authors = ["Szymon Kopciewski"]
  spec.email = ["s.kopciewski@dlamnie.net"]
  spec.summary = "Micro-framework for building applications with data-driven architecture"
  spec.description = "Micro-framework for building applications with data-driven architecture"
  spec.homepage = "https://github.com/skopciewski/mainapp"
  spec.license = "GPL-3.0"

  spec.require_paths = ["lib"]
  spec.files = Dir.glob("{lib}/**/*") + \
    %w[Gemfile LICENSE README.md CHANGELOG.md]

  spec.add_development_dependency "minitest"
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "solargraph"
end
