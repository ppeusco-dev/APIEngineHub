module CurrencyEngine
  module Api
    module V1
      class ConversionController < ApplicationController
        def convert
          from_currency = params[:from]
          to_currency = params[:to]
          amount = params[:amount].to_f

          service = CurrencyEngine::ConversionService.new(ENV['CURRENCY_API_KEY'])
          result = service.convert(from_currency, to_currency, amount)

          render json: Oj.dump(result), status: :ok
        rescue StandardError => e
          render json: { error: e.message }, status: :bad_request
        end
      end
    end
  end
end
