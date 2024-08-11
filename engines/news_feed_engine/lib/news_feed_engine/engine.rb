require "dotenv-rails"

module NewsFeedEngine
  class Engine < ::Rails::Engine
    isolate_namespace NewsFeedEngine

    config.before_configuration do
      Dotenv.load(
        Pathname.new(root).join(".env"),
        Pathname.new(root).join(".env.#{Rails.env}")
      )
    end
  end
end
