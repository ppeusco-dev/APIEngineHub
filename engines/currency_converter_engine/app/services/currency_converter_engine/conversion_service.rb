module CurrencyConverterEngine
  class ConversionService
    BASE_URL = "https://api.exchangeratesapi.io/latest"

    def initialize(api_key)
      @api_key = api_key
      @connection = Faraday.new(url: BASE_URL) do |faraday|
        faraday.headers["Content-Type"] = "application/json"
        faraday.adapter :http
      end
    end

    def convert(from_currency, to_currencies, amount)
      query_params = {
        base: from_currency,
        symbols: to_currencies.join(","), # Convierte el array en una cadena separada por comas
        access_key: @api_key
      }

      response = @connection.get("", query_params)
      if response.success?
        rates = Oj.load(response.body)["rates"]
        conversions = to_currencies.each_with_object({}) do |currency, result|
          result[currency] = amount * rates[currency] if rates[currency]
        end
        { amount: amount, from_currency: from_currency, conversions: conversions }
      else
        raise "Error fetching conversion rates: #{response.status}"
      end
    end
  end
end
