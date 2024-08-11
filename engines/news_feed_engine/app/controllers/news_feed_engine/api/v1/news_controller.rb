module NewsFeedEngine
  module Api
    module V1
      class NewsController < ApplicationController
        def index
          news_service = NewsService.new(ENV["NEWS_API_KEY"])
          headlines = news_service.fetch_top_headlines(params[:country])

          render json: Oj.dump(headlines), status: :ok
        rescue StandardError => e
          render json: { error: e.message }, status: :bad_request
        end

        private

        def news_params
          params.permit(:country)
        end
      end
    end
  end
end
