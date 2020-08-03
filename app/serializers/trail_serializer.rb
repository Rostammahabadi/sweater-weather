class TrailSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location, :forecast, :trails
  set_type :trail
end
