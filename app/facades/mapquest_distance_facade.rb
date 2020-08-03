class MapquestDistanceFacade
  attr_reader :service
  def initialize(to, from)
    @service ||= MapquestDirectionService.new.get_distance(to, from)
  end
end
