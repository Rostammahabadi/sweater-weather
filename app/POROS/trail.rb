class Trail
  attr_reader :location, :forecast, :trails
  def initialize(data)
    @location = data[:location]
    @forecast = {}
    @trails = []
  end
end
