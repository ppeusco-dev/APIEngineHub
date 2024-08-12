module CurrencyConverterEngine
  module Api
    module V1
      class ConversionController < ApplicationController
        before_action :validate_params, only: [:convert]

        def convert
          query_params_builder = CurrencyConverterEngine::QueryParamsBuilder.call(
            from_currency: params[:from_currency],
            to_currencies: params[:to_currency].split(","),
            amount: params[:amount].to_f,
            api_key: ENV["CURRENCY_API_KEY"]
          )

          result = CurrencyConverterEngine::ConversionService.call(query_params_builder)

          return render json: { error: result.data[:error] }, status: :unprocessable_entity unless result.success?

          render json: Oj.dump(result.data), status: :ok
        rescue StandardError => e
          logger.error "Error processing conversion: #{e.message}"
          render json: { error: e.message }, status: :bad_request
        end

        private

        def validate_params
          if params[:from_currency].blank? || params[:to_currency].blank? || params[:amount].blank?
            render json: { error: 'Missing required parameters' }, status: :bad_request and return
          end
        end
      end
    end
  end
end
