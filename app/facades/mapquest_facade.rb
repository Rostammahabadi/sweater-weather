class MapquestFacade
  attr_reader :location
  def initialize(location)
    @location = location
    @service ||= MapquestAddressService.new
  end

  def get_lat_and_long
    @service.get_lat_and_long(@location)
  end

end
