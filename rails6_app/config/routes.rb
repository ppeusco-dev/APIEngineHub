Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'weather/:city', to: 'weather#show'
  get 'news', to: 'news#index'
end
