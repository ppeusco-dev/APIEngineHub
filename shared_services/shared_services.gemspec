# frozen_string_literal: true
require_relative "lib/shared_services/version"

Gem::Specification.new do |spec|
  spec.name = "shared_services"
  spec.version = SharedServices::VERSION
  spec.authors = ["Pablo Peuscovich"]
  spec.email = ["ppeusco@gmail.com"]

  spec.summary = "A shared service library for Ruby applications."
  spec.description = "SharedServices is a library that provides common service object functionality for Ruby applications, enabling reusable and maintainable service objects across multiple projects."
  spec.homepage    = 'http://example.com'
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7.6"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/username/shared_services"
  spec.metadata["changelog_uri"] = "https://github.com/username/shared_services/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
end

