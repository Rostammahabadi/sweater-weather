require 'date'
class WeatherFacade
  attr_reader :response
  def initialize(destination, unit)
    @destination = destination
    @unit = unit
    @response ||= get_weather_for(destination, unit)
  end

  def get_weather_for(destination, unit)
    OpenWeatherApiService.new.get_weather(destination, unit)
  end
end
