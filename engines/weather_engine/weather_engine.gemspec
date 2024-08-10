require_relative "lib/weather_engine/version"

Gem::Specification.new do |spec|
  spec.name        = "weather_engine"
  spec.version     = WeatherEngine::VERSION
  spec.authors     = [ "Pablo Peuscovich" ]
  spec.email       = [ "ppeusco@gmail.com" ]
  spec.homepage    = 'http://example.com'
  spec.summary     = "WeatherEngine: Fetch and provide weather data via public APIs."
  spec.description = "WeatherEngine is a Rails engine designed to fetch weather data from public APIs like OpenWeatherMap. It provides a simple and extensible way to integrate weather information into your Rails applications, including features for handling API responses and managing errors gracefully."
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
