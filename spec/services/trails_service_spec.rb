require 'rails_helper'

RSpec.describe "the trails service" do
  it "gets the data" do
    service = File.read("./spec/fixtures/hiking_project.json")
    json = JSON.parse(service, symbolize_names: true)
    expect(json[:trails].first[:name]).to eq("Boulder Skyline Traverse")
    expect(json[:trails].first[:summary]).to eq("The classic long mountain route in Boulder.")
    expect(json[:trails].first[:difficulty]).to eq("black")
    expect(json[:trails].first[:location]).to eq("Superior, Colorado")
    expect(json[:trails].first[:longitude]).to eq(-105.2582)
    expect(json[:trails].first[:latitude]).to eq(39.9388)
  end
end
