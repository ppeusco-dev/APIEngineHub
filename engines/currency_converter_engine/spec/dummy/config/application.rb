# spec/dummy/config/application.rb
require_relative 'boot'

# Cargar solo los componentes necesarios de Rails
require "rails"
require "action_controller/railtie"  # Solo se requiere el controlador
# require "active_model/railtie"
# require "active_job/railtie"
# require "active_record/railtie"  # No cargar ActiveRecord
# require "action_mailer/railtie"
# require "action_view/railtie"
# require "action_cable/engine"
# require "sprockets/railtie" if ENV['INCLUDE_SPROCKETS']

Bundler.require(*Rails.groups)
require "currency_converter_engine"

module Dummy
  class Application < Rails::Application
    config.load_defaults 7.2

    # Deshabilitar la carga de ActiveRecord y otros generadores innecesarios
    config.generators do |g|
      g.orm nil # No cargar ningún ORM
      g.assets false # No generar archivos de assets
      g.helper false # No generar archivos de helper
      g.test_framework :rspec, fixture: false # Configurar RSpec sin fixtures
    end

    # Desactivar la carga de vistas y assets
    config.api_only = true
  end
end
