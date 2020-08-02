class OpenWeatherService
  def get_weather(destination, unit)
    params = {q: destination, units: unit}
    get_json("weather", params)
  end

  private

  def get_json(url = nil, params)
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'http://api.openweathermap.org/data/2.5') do |f|
      f.params[:appid] = ENV['OPEN_WEATHER_API_KEY']
    end
  end
end
