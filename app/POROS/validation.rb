class Validation
  attr_reader :response
  def initialize(city_state)
    city = city_state.split(",")[0]
    state = city_state.split(",")[1]
    @response = validate(state, city)
  end

  def validate(state, city)
    return false if state.nil?
    return false if city.nil?
    return false if ::States[state.upcase].nil?
    file = File.read("./app/jsons/city_state.json")
    json = JSON.parse(file, symbolize_names: true)
    state = ::States[state.upcase].to_sym
    json.keys.include?(state.to_sym) && json[state].include?(city.capitalize)
  end
end
