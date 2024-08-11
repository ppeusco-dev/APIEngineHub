# app/controllers/currency_controller.rb

class CurrencyController < ApplicationController
  def convert
    service = CurrencyConversionService.new
    result = service.convert(params[:from_currency], params[:to_currency], params[:amount])

    render json: result, status: :ok
  rescue StandardError => e
    render json: { error: e.message }, status: :bad_request
  end
end
