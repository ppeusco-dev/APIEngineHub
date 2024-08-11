# frozen_string_literal: true

require_relative "lib/http_wrapper/version"

Gem::Specification.new do |spec|
  spec.name = "http_wrapper"
  spec.version = HttpWrapper::VERSION
  spec.authors = ["Pablo Peuscovich"]
  spec.email = ["ppeusco@gmail.com"]

  spec.summary = "A simple HTTP wrapper for handling API requests with Faraday."
  spec.description = "The HTTP Wrapper gem provides a straightforward interface for making API requests in Ruby, utilizing Faraday with HTTP.rb as the adapter. It includes error handling and JSON (Oj) parsing capabilities."
  spec.homepage = "https://github.com/username/http_wrapper"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/username/http_wrapper"
  spec.metadata["changelog_uri"] = "https://github.com/username/http_wrapper/blob/main/CHANGELOG.md"

  spec.files = Dir.glob("**/*").reject { |f| f.start_with?("test/", "spec/", "features/", ".git/", ".github/") }
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'faraday', '~> 2.0'
  spec.add_runtime_dependency 'oj', '~> 3.13'
end
