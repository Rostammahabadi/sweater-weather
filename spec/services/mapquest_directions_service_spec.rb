require 'rails_helper'

describe "Mapquest Direction Service" do
  it "gets distance between two lat and longs" do

    service_return = MapquestDirectionService.new.get_distance("39.738453,-104.984853","38.265425,-104.610415")

    expect(service_return).to eq(111.381)
  end
end
