class WeatherController < ApplicationController
  def show
    weather_service = WeatherService.new
    @weather = weather_service.fetch_weather(params[:city])
    render json: @weather
  end
end
