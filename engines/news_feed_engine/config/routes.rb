# engines/news_engine/config/routes.rb
NewsFeedEngine::Engine.routes.draw do
  root to: "api/v1/news#index"

  namespace :api do
    namespace :v1 do
      resources :news, only: [ :index ]
    end
  end
end
