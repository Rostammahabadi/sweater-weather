require 'rails_helper'

describe "Trails API" do
  it "can get the info" do
    VCR.use_cassette("sends back the necessary information") do

      get '/api/v1/trails?location=denver,co'

      expect(response).to be_successful
      trails_response = JSON.parse(response.body)
      expect(trails_response["data"]["id"]).to eq("null")
      expect(trails_response["data"]["attributes"]["location"]).to eq("denver,co")
      expect(trails_response["data"]["attributes"]["forecast"]["summary"]).to eq('few clouds')
      expect(trails_response["data"]["attributes"]["forecast"]["temperature"]).to eq(76.78)
      expect(trails_response["data"]["attributes"]["trails"].first["name"]).to eq("Boulder Skyline Traverse")
      expect(trails_response["data"]["attributes"]["trails"].first["summary"]).to eq("The classic long mountain route in Boulder.")
      expect(trails_response["data"]["attributes"]["trails"].first["location"]).to eq("Superior, Colorado")
      expect(trails_response["data"]["attributes"]["trails"].first["distance_to_trail"]).to eq(26.686)
    end
  end
end
