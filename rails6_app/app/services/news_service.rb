class NewsService
  BASE_URL = 'http://localhost:3000/news_feed/api/v1/'

  def initialize(http_client: HttpWrapper::Client.new(BASE_URL))
    @http_client = http_client
  end

  def fetch_top_headlines(country = 'us')
    response = @http_client.get('news', { country: country })
    if response['error']
      raise "Error fetching news: #{response['error']}"
    else
      response
    end
  end
end
