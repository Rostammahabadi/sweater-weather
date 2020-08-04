require 'rails_helper'

describe "Forecast request" do
  it "gets the forecast for a city" do
    VCR.use_cassette("get forecast") do

      get "/api/v1/forecast", params: {location: "denver,co"}

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      # test for current information
      expect(json[:data][:attributes][:current][:datetime]).to eq(1596563040)
      expect(json[:data][:attributes][:current][:temp_high]).to eq(88.81)
      expect(json[:data][:attributes][:current][:temp_low]).to eq(69.21)
      expect(json[:data][:attributes][:current][:uvi]).to eq(10.89)
      expect(json[:data][:attributes][:current][:humidity]).to eq(43)
      expect(json[:data][:attributes][:current][:visibility]).to eq(10000)
      expect(json[:data][:attributes][:current][:feels_like]).to eq(82.71)
      expect(json[:data][:attributes][:current][:sunrise]).to eq(1596542579)
      expect(json[:data][:attributes][:current][:sunset]).to eq(1596593424)
      expect(json[:data][:attributes][:current][:description]).to eq("scattered clouds")
      # test for daily information
      expect(json[:data][:attributes][:daily].count).to eq(6)
      expect(json[:data][:attributes][:daily].first[:description]).to eq("moderate rain")
      expect(json[:data][:attributes][:daily].first[:rain]).to eq(4.62)
      expect(json[:data][:attributes][:daily].first[:temp_max]).to eq(88.81)
      expect(json[:data][:attributes][:daily].first[:temp_low]).to eq(69.21)
      #test for hourly information
      expect(json[:data][:attributes][:hourly].count).to eq(8)
      expect(json[:data][:attributes][:hourly].first[:datetime]).to eq(1596560400)
      expect(json[:data][:attributes][:hourly].first[:description]).to eq("scattered clouds")
      expect(json[:data][:attributes][:hourly].first[:temp]).to eq(81.21)
    end
  end
  it "returns incorrect city state pair" do
    VCR.use_cassette("get forecast for incorrect city state") do
      get '/api/v1/forecast', params: {location: "asdf,ghuoew"}

      expect(response.status).to eq(400)
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:error]).to eq("Incorrect city/state combination")
    end
  end
end
