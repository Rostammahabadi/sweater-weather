class DirectionsFacade
  attr_reader :origin, :destination, :travel_time, :arrival_forecast
  def initialize(origin, destination, origin_lat_lng, destination_lat_lng)
    @origin = origin
    @destination = destination
    @travel_time = create_travel_time(origin_lat_lng, destination_lat_lng)
    @arrival_forecast = create_arrival_forecast(destination_lat_lng)
  end

  private

  def create_travel_time(origin, destination)
    MapquestDirectionService.new.get_distance(format_lat_lng(origin),format_lat_lng(destination))
  end

  def create_arrival_forecast(destination)
    weather = OpenWeatherService.new.get_weather_for_lat_and_lng(destination[:lat], destination[:lng], "imperial")
    {datetime: weather[:current][:dt], description: weather[:current][:weather].first[:description]}
  end


  def format_lat_lng(lat_long_data)
    lat_long_data[:lat].to_s + "," + lat_long_data[:lng].to_s
  end

  def id
    "1"
  end
end
