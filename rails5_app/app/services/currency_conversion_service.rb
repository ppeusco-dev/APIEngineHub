# app/services/currency_conversion_service.rb

class CurrencyConversionService
  BASE_URL = 'http://localhost:3000/currency_converter/api/v1/'


  def initialize(http_client: HttpWrapper::Client.new(BASE_URL))
    @http_client = http_client
  end

  def convert(from_currency, to_currency, amount)
    query_params = {
      from_currency: from_currency,
      to_currency: to_currency,
      amount: amount
    }

    response = @http_client.get('convert', query_params)

    if response['error']
      raise "Error fetching conversion rate: #{response['error']}"
    else
      response
    end
  end
end
