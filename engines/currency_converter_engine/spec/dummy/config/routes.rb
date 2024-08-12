Rails.application.routes.draw do
  mount CurrencyConverterEngine::Engine, at: '/'
end
