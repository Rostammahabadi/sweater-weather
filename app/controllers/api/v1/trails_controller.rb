class Api::V1::TrailsController < ApplicationController
  def index
    render json: TrailSerializer.new(create_trail_object)
  end

  private

  def trails_params
    params.permit(:location)
  end

  def create_trail_object
    lat_and_long = MapquestFacade.new(trails_params[:location]).get_lat_and_long
    weather = WeatherFacade.new(lat_and_long[:lat], lat_and_long[:lng], "imperial")
    trails = TrailFacade.new(lat_and_long[:lat], lat_and_long[:lng])
    Trail.new(trails_params[:location], weather, trails)
  end
end
