class Api::V1::ForecastController < ApplicationController
  def index
    render json: ForecastSerializer.new(Weather.new(create_weather_objects.response))
  end

  private

  def forecast_params
    params.permit(:location)
  end

  def create_weather_objects
    facade = MapquestFacade.new(forecast_params)
    lat_and_long = facade.get_lat_and_long
    WeatherFacade.new(lat_and_long[:lat], lat_and_long[:lng], "imperial")
  end
end
