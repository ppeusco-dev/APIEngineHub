require 'erb'

class WeatherService
  BASE_URL = 'http://localhost:3000/weather/api/v1/'

  def initialize(http_client: HttpWrapper::Client.new(BASE_URL))
    @http_client = http_client
  end

  def fetch_weather(city)
    encoded_city = ERB::Util.url_encode(city)
    query_params = {
      q: encoded_city
    }

    response = @http_client.get("weather/#{encoded_city}")
    
    if response['error']
      raise "Error fetching conversion rate: #{response['error']}"
    else
      response
    end
  end
end

