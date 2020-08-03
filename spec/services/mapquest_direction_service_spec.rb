require 'rails_helper'

describe "mapquest direction service" do
  it"returns distance" do
    VCR.use_cassette("mapquest direction service") do
      new_service = MapquestDirectionService.new.get_distance("39.74,-104.98", "39.9388,-105.2582")
      expect(new_service).to eq(26.686)
    end
  end
end
