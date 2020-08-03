class Api::V1::TrailsController < ApplicationController
  def index
    lat_and_long = MapquestFacade.new(trails_params[:location]).get_lat_and_long
    weather = WeatherFacade.new(lat_and_long[:lat], lat_and_long[:lng], "imperial")
    Trail.new(trails_params[:location], weather, )
  end

  private

  def trails_params
    params.permit(:location)
  end
end
