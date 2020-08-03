class TrailFacade
  attr_reader :name, :summary, :difficulty, :location, :distance_to_trail, :data
  def initialize(lat, lng)
    @data = get_trails(lat, lng)
  end

  def get_trails(lat, lng)
    HikingProjectService.new.get_trails_by_lat_lng(lat, lng)
  end


end
