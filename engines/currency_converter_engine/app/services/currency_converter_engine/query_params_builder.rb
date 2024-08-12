module CurrencyConverterEngine
  class QueryParamsBuilder < SharedServices::ApplicationService
    attr_reader :from_currency, :to_currencies, :amount

    def initialize(from_currency:, to_currencies:, amount:, api_key:)
      @from_currency = from_currency
      @to_currencies = to_currencies
      @amount = amount
      @api_key = api_key
    end

    def call
      params = {
        base: @from_currency,
        symbols: @to_currencies.join(","),
        access_key: @api_key
      }

      return failure_response("Invalid parameters") unless params_valid?(params)

      success_response(params)
    end

    private

    def params_valid?(params)
      params[:base].present? && params[:symbols].present? && params[:access_key].present?
    end
  end
end
