class Api::V1::RoadTripController < ApplicationController
  def create
    if road_trip_params[:api_key]
      user = User.find_by(api_key: road_trip_params[:api_key])
      if !user.nil?
        render json: RoadTripSerializer.new(create_road_trip)
      else
        render json: { error: "Invalid API key"}, status: 401
      end
    else
      render json: {error: "Provide an API Key"}, status: 401
    end
  end

  private

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end

  def create_road_trip
    from_lat_lng = MapquestFacade.new(params[:origin]).lat_long
    to_lat_lng = MapquestFacade.new(params[:destination]).lat_long
    direction = DirectionsFacade.new(road_trip_params[:origin], road_trip_params[:destination],from_lat_lng, to_lat_lng)
  end
end
