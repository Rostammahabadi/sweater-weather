class TrailFacade
  attr_reader :name, :summary, :difficulty, :location, :distance_to_trail
  def initialize(params)
    @data = get_trails(params)
    @name = get_name(@data)
    @summary = get_summary(@data)
    @difficulty = get_difficulty(@data)
    @location = get_location(@data)
    @distance_to_trail = get_distance_to_trail(@data)
  end

  def get_trails(params)
    HikingProjectService.new(params[:lat], params[:lng])
  end

  
end
