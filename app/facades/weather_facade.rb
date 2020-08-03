class WeatherFacade
  attr_reader :response
  def initialize(lat, lng, unit)
    @response = get_weather_for(lat, lng, unit)
  end

  def get_weather_for(lat, lng, unit)
    OpenWeatherService.new.get_weather_for_lat_and_lng(lat, lng, unit)
  end

  def create_weather(response)
    Weather.new(response)
  end
end
