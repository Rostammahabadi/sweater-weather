class Trail
  attr_reader :location, :forecast, :trails
  def initialize(location, forecast_data, trails_data)
    @location = location
    @forecast = {}
    @trails = []
    create_forecast(forecast_data)
    create_trails(trails_data)
  end

  def create_forecast(data)

  end

  def create_trails(data)

  end
end
