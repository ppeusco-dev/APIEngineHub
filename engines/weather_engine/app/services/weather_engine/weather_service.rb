module WeatherEngine
  class WeatherService
    BASE_URL = "https://api.openweathermap.org/data/2.5/"

    def initialize(api_key)
      @api_key = api_key
      @connection = Faraday.new(url: BASE_URL) do |faraday|
        faraday.headers["Content-Type"] = "application/json"
        faraday.adapter :http
      end
    end

    def fetch_weather(city)
      query_params = {
        q: city,
        appid: @api_key
      }.compact

      response = @connection.get("weather", query_params)

      if response.success?
        Oj.load(response.body)
      else
        raise "Error fetching weather data: #{response.status}"
      end
    end
  end
end
