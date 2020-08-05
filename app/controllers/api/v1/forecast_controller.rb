class Api::V1::ForecastController < ApplicationController
  def index
    if create_weather_objects
      render json: ForecastSerializer.new(Weather.new(create_weather_objects.response))
    else
      render json: Error.new.city_state_combo, status: 400
    end
  end

  private

  def forecast_params
    params.permit(:location)
  end

  def create_weather_objects
    validation = Validation.new(forecast_params[:location])
    if validation.response == true
      facade = MapquestFacade.new(forecast_params)
      lat_and_long = facade.get_lat_and_long
      WeatherFacade.new(lat_and_long[:lat], lat_and_long[:lng], "imperial")
    else
      return
    end
  end
end
