require_relative "lib/currency_converter_engine/version"

Gem::Specification.new do |spec|
  spec.name        = "currency_converter_engine"
  spec.version     = CurrencyConverterEngine::VERSION
  spec.authors     = [ "Pablo Peuscovich" ]
  spec.email       = [ "ppeusco@gmail.com" ]
  spec.homepage    = 'http://example.com'
  spec.summary     = "TODO: Summary of CurrencyConverterEngine."
  spec.description = "TODO: Description of CurrencyConverterEngine."
  spec.license     = "MIT"

  spec.summary     = "Engine for currency conversion using public APIs."
  spec.description = "This engine provides currency conversion services by interacting with external APIs like ExchangeRatesAPI."

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata['source_code_uri'] = 'http://example.com'
  spec.metadata['changelog_uri'] = 'http://example.com'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.2.0"
end
