Rails.application.routes.draw do
  mount NewsFeedEngine::Engine => "/news_feed_engine"
end
