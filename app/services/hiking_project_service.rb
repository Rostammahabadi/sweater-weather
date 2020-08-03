class HikingProjectService

  def get_trails_by_lat_lng(params)
    params = {lat: params[:lat], lon: params[:lon]}
    conn.get("get-trails", params)
  end
  private

  def conn
    Faraday.new(url: "https://www.hikingproject.com/data") do |f|
      f.params[:key] = ENV['HIKING_PROJECT_API_KEY']
    end
  end

  def get_json(url, params)
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end
end
