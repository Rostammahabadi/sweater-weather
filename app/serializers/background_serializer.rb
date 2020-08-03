class BackgroundSerializer
  include FastJsonapi::ObjectSerializer
  attributes :url
  set_id :id
end
