class Trail
  attr_reader :location, :forecast, :trails, :distance_to_trail
  def initialize(location, forecast_data, trails_data, distance_data)
    binding.pry
    @location = location
    @forecast = {}
    @trails = []
    @distance_to_trail = ""
    create_forecast(forecast_data)
    create_trails(trails_data)
    create_distance_to_trail(distance_data)
  end

  def create_forecast(data)

  end

  def create_trails(data)

  end

  def create_distance_to_trail(data)
end
