require 'rails_helper'

RSpec.describe "mapquest geocoding" do
  it "returns the lat and long using fixture" do

    json = File.read("./spec/fixtures/mapquest_geocoding.json")

    response = JSON.parse(json, symbolize_names: true)

    expect(response[:results].first[:locations].first[:latLng][:lat]).to eq(39.738453)
    expect(response[:results].first[:locations].first[:latLng][:lng]).to eq(-104.984853)
  end

  it "return the lat and long using service" do
    facade = MapquestFacade.new("denver,co")
    lat_and_lng = facade.get_lat_and_long
    expect(lat_and_lng[:lat]).to eq(39.738453)
    expect(lat_and_lng[:lng]).to eq(-104.984853)
  end
end
