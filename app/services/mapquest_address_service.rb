class MapquestAddressService

  def get_lat_and_long(location)
    params = {location: location}
    data = get_json('address/', params)
    {:lat =>get_lat(data), :lng => get_long(data)}
  end


  private

  def conn
    Faraday.new(url: "http://www.mapquestapi.com/geocoding/v1/") do |f|
      f.params[:key] = ENV['MAPQUEST_API_KEY']
      f.params[:outFormat] = "json"
      f.params[:thumbMaps] = false
      f.params[:inFormat] = "kvp"
    end
  end

  def get_json(url, params)
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_lat(data)
    data[:results].first[:locations].first[:displayLatLng][:lat]
  end

  def get_long(data)
    data[:results].first[:locations].first[:displayLatLng][:lng]
  end
end
