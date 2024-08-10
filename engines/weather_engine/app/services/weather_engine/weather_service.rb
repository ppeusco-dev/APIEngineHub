module WeatherEngine
  class WeatherService
    BASE_URL = 'https://api.openweathermap.org/data/2.5/'

    def initialize(api_key)
      @api_key = api_key
      @connection = Faraday.new(url: BASE_URL) do |faraday|
        faraday.adapter :http
      end
    end

    def fetch_weather(city)
      response = @connection.get('weather', { q: city, appid: @api_key })
      if response.success?
        Oj.load(response.body)  # Usando Oj para deserializar el JSON
      else
        raise "Error fetching weather data: #{response.status}"
      end
    end
  end
end

