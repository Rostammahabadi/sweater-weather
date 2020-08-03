class MapquestDirectionService
  def get_distance(lat,lng)
  params = {from: lat, to: lng}
  data = get_json('route', params)
  {:lat =>get_lat(data), :lng => get_long(data)}
end


private

def conn
  Faraday.new(url: "https://www.mapquestapi.com/directions/v2") do |f|
    f.params[:key] = ENV['MAPQUEST_API_KEY']
    f.params[:outFormat] = "json"
    f.params[:ambiguities] = "ignore"
    f.params[:roteType] = "fastest"
    f.params[:doReverseGeocoding] = true
    f.params[:enhancedNarrative] = false
    f.params[:avoidTimedConditions] = false
  end
end

def get_json(url, params)
  response = conn.get(url, params)
  JSON.parse(response.body, symbolize_names: true)
end
end
