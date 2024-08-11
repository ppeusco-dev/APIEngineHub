module CurrencyConverterEngine
  module Api
    module V1
      class ConversionController < ApplicationController
        def convert
          service = ConversionService.new(ENV["CURRENCY_API_KEY"])
          to_currencies = params[:to_currency].split(",")
          result = service.convert(params[:from_currency], to_currencies, params[:amount].to_f)

          render json: Oj.dump(result), status: :ok
        rescue StandardError => e
          render json: { error: e.message }, status: :bad_request
        end
      end
    end
  end
end
