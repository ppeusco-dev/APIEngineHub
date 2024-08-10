Rails.application.routes.draw do
  mount CurrencyConverterEngine::Engine => "/currency_converter_engine"
end
