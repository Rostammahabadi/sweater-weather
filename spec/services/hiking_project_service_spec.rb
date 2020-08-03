require 'rails_helper'

describe "hiking project service" do
  it" can get info" do
    VCR.use_cassette("can return information") do
      new_service = HikingProjectService.new.get_trails_by_lat_lng(39.74, -104.98)
      expect(new_service[:trails].first[:name]).to eq("Boulder Skyline Traverse")
      expect(new_service[:trails].first[:summary]).to eq("The classic long mountain route in Boulder.")
      expect(new_service[:trails].first[:difficulty]).to eq("black")
      expect(new_service[:trails].first[:location]).to eq("Superior, Colorado")
      expect(new_service[:trails].first[:longitude]).to eq(-105.2582)
      expect(new_service[:trails].first[:latitude]).to eq(39.9388)
    end
  end
end
