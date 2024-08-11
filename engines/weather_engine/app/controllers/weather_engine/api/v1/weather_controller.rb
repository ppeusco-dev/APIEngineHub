module WeatherEngine
  module Api
    module V1
      class WeatherController < ApplicationController
        def show
          service = WeatherService.new(ENV["WEATHER_API_KEY"])
          begin
            weather_data = service.fetch_weather(params[:city])
            render json: Oj.dump(weather_data), status: :ok  # Usando Oj para serializar el JSON
          rescue StandardError => e
            render json: { error: e.message }, status: :bad_request
          end
        end
      end
    end
  end
end
