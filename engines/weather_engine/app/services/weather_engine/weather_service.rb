module WeatherEngine
  class WeatherService
    BASE_URL = "https://api.openweathermap.org/data/2.5/"

    def initialize(api_key)
      @api_key = api_key
      @client = HttpWrapper::Client.new(BASE_URL)
    end

    def fetch_weather(city)
      query_params = {
        q: city,
        appid: @api_key
      }.compact

      response = @client.get("weather", query_params)

      if response.success?
        Oj.load(response.body)
      else
        raise "Error fetching weather data: #{response.status}"
      end
    end
  end
end


