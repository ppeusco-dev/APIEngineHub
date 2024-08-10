module CurrencyEngine
  class ConversionService
    BASE_URL = 'https://api.exchangeratesapi.io/latest'

    def initialize(api_key)
      @api_key = api_key
      @connection = Faraday.new(url: BASE_URL) do |faraday|
        faraday.adapter :http
      end
    end

    def convert(from_currency, to_currency, amount)
      response = @connection.get('', { base: from_currency, symbols: to_currency, access_key: @api_key })
      if response.success?
        rates = Oj.load(response.body)["rates"]
        converted_amount = amount * rates[to_currency]
        { amount: converted_amount, rate: rates[to_currency] }
      else
        raise "Error fetching conversion rate: #{response.status}"
      end
    end
  end
end
