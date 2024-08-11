WeatherEngine::Engine.routes.draw do
  namespace :api do
    namespace :v1 do
      get "weather/:city", to: "weather#show"
    end
  end
end
