require 'rails_helper'

RSpec.describe "api testing" do
  it "gives information when passed lat and long and unit" do
    file = File.read('spec/fixtures/one_call_weather.json')

    response = JSON.parse(file, symbolize_names: true)

    expect(response[:current][:dt]).to eq(1596413057)
    expect(response[:current][:sunrise]).to eq(1596369620)
    expect(response[:current][:sunset]).to eq(1596420710)
    expect(response[:current][:temp]).to eq(79.83)
    expect(response[:current][:feels_like]).to eq(76.15)
    expect(response[:current][:humidity]).to eq(30)
    expect(response[:current][:uvi]).to eq(10.3)
    expect(response[:current][:visibility]).to eq(10000)
    expect(response[:current][:weather].first[:description]).to eq("light rain")
    expect(response[:current][:dt]).to eq(1596413057)
    expect(response[:daily].first[:temp][:min]).to eq(74.12)
    expect(response[:daily].first[:temp][:max]).to eq(79.83)
  end
end
