class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :current, :daily, :hourly
  set_type :weather
end
