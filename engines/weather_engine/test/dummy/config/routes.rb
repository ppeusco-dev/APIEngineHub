Rails.application.routes.draw do
  mount WeatherEngine::Engine => "/weather_engine"
end
