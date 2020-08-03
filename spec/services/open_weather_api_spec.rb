require 'rails_helper'

RSpec.describe "api testing" do
  it "gives information when passed destination and unit" do
    file = File.read('spec/fixtures/weather_api_day.json')

    response = JSON.parse(file, symbolize_names: true)

    expect(response[:main][:temp]).to eq(86.22)
    expect(response[:main][:temp_min]).to eq(84)
    expect(response[:main][:temp_max]).to eq(88)
    expect(response[:weather].first[:description]).to eq("few clouds")
    time = response[:dt]
    expect(time).to eq(1596308367)
  end
end
