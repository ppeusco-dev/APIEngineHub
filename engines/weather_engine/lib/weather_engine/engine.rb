require "dotenv-rails"

module WeatherEngine
  class Engine < ::Rails::Engine
    isolate_namespace WeatherEngine

    config.before_configuration do
      Dotenv.load(
        Pathname.new(root).join(".env"),
        Pathname.new(root).join(".env.#{Rails.env}")
      )
    end
  end
end
