require_relative "lib/news_feed_engine/version"

Gem::Specification.new do |spec|
  spec.name        = "news_feed_engine"
  spec.version     = NewsFeedEngine::VERSION
  spec.authors     = [ "Pablo Peuscovich" ]
  spec.email       = [ "ppeusco@gmail.com" ]
  spec.homepage    = 'http://example.com'
  spec.summary     = "Engine for fetching news using public APIs."
  spec.description = "This engine provides news fetching services by interacting with external APIs like NewsAPI, allowing you to retrieve top headlines and other news-related data."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata['source_code_uri'] = 'http://example.com'
  spec.metadata['changelog_uri'] = 'http://example.com'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.2.0"
end
