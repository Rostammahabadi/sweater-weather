class MapquestFacade
  attr_reader :location, :lat_long
  def initialize(location)
    @location = location
    @lat_long = get_lat_and_long
  end

  def get_lat_and_long
    MapquestAddressService.new.get_lat_and_long(@location)
  end

  def get_directions
    MapquestDirectionService.new.get_distance
  end
end
