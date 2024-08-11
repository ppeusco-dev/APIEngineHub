module NewsFeedEngine
  class NewsService
    BASE_URL = "https://newsapi.org/v2/"

    def initialize(api_key)
      @api_key = api_key
      @connection = Faraday.new(url: BASE_URL) do |faraday|
        faraday.headers["Content-Type"] = "application/json"
        faraday.adapter :http
      end
    end

    def fetch_top_headlines(country = nil)
      country ||= "us"
      query_params = {
        country: country,
        apiKey: @api_key
      }.compact # Elimina valores nil

      response = @connection.get("top-headlines", query_params)
      if response.success?
        Oj.load(response.body)
      else
        raise "Error fetching news: #{response.status}"
      end
    end
  end
end
