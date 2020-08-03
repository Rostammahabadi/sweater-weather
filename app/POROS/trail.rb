class Trail
  attr_reader :location, :forecast, :trails
  def initialize(location, forecast_data, trails_data)
    @location = location
    @forecast = create_forecast(forecast_data)
    @trails =  create_trails(trails_data, forecast_data.response[:lat], forecast_data.response[:lon])
  end

  def create_forecast(data)
    {summary: data.response[:current][:weather].first[:description],
    temperature: data.response[:current][:temp]}
  end

  def create_trails(data, lat, lon)
    format_lat_lng = lat.to_s + "," + lon.to_s
    data.data[:trails].each_with_object([]) do |trail, arr|
      hsh = {}
      formatted_lat_lng = trail[:latitude].to_s + "," + trail[:longitude].to_s
      hsh[:name] = trail[:name]
      hsh[:summary] = trail[:summary]
      hsh[:location] = trail[:location]
      hsh[:distance_to_trail] = MapquestDirectionService.new.get_distance(format_lat_lng, formatted_lat_lng)
      arr << hsh
    end
  end

  def null
    "null"
  end

end
