class NewsController < ApplicationController
  def index
    news_service = NewsService.new
    @headlines = news_service.fetch_top_headlines(params[:country])
    render json: @headlines
  end
end
