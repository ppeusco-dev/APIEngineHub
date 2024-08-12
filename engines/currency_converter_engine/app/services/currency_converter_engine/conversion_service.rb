module CurrencyConverterEngine
  class ConversionService < SharedServices::ApplicationService
    BASE_URL = "https://api.exchangeratesapi.io/latest"

    def initialize(query_params_builder)
      @query_params_builder = query_params_builder
      @client = HttpWrapper::Client.new(BASE_URL)
    end

    def call
      query_params = @query_params_builder.call

      response = @client.get("", query_params)
      return failure_response("Error fetching conversion rates: #{response.status}") unless response.success?

      rates = parse_rates(response.body)
      conversions = convert_amounts(@query_params_builder.amount, @query_params_builder.to_currencies, rates)

      success_response({ amount: @query_params_builder.amount, from_currency: @query_params_builder.from_currency, conversions: conversions })
    end

    private

    def parse_rates(response_body)
      Oj.load(response_body)["rates"]
    end

    def convert_amounts(amount, to_currencies, rates)
      to_currencies.each_with_object({}) do |currency, result|
        result[currency] = amount * rates[currency] if rates[currency]
      end
    end
  end
end
