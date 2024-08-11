require "dotenv-rails"

module CurrencyConverterEngine
  class Engine < ::Rails::Engine
    isolate_namespace CurrencyConverterEngine

    config.before_configuration do
      Dotenv.load(
        Pathname.new(root).join(".env"),
        Pathname.new(root).join(".env.#{Rails.env}")
      )
    end
  end
end
