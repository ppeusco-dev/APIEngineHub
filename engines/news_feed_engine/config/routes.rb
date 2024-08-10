# engines/news_engine/config/routes.rb
NewsEngine::Engine.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :news, only: [:index]
    end
  end
end

