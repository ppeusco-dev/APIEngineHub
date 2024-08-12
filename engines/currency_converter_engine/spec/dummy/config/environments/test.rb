Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Disable eager loading in the test environment
  config.eager_load = false

  # Configure static asset server for tests with Cache-Control for performance.
  config.serve_static_assets = true
  config.static_cache_control = 'public, max-age=3600'

  # Use a different cache store in test
  config.cache_store = :null_store

  # Ensure assets are not precompiled during tests
  config.assets.compile = true
  config.assets.debug = false
  config.assets.digest = true
end
