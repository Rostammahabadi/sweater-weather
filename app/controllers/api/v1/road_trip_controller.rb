class Api::V1::RoadTripController < ApplicationController
  def index
    from_lat_lng = MapquestFacade.new(params[:origin]).get_lat_and_long
    to_lat_lng = MapquestFacade.new(params[:destination]).get_lat_and_long
    binding.pry
  end
end
