CurrencyConverterEngine::Engine.routes.draw do
  namespace :api do
    namespace :v1 do
      get "convert", to: "conversion#convert"
    end
  end
end
