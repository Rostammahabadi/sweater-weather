require 'rails_helper'

describe "road trip" do
  it "gets the information from the road trip endpoint" do
    VCR.use_cassette("get road trip details") do
      user = User.create(email: "asdf@gmail.com", password: "asdfasdf", password_confirmation: "asdfasdf", api_key: "asdfasdfasdf")

      post '/api/v1/road_trip', params: {origin: "denver,co", destination: "boulder,co", api_key: "#{user.api_key}"}

      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:data][:attributes][:origin]).to eq("denver,co")
      expect(json[:data][:attributes][:destination]).to eq("boulder,co")
      expect(json[:data][:attributes][:travel_time]).to eq(30.098)
      expect(json[:data][:attributes][:arrival_forecast][:datetime]).to eq(1596569728)
      expect(json[:data][:attributes][:arrival_forecast][:description]).to eq("clear sky")
    end
  end
  it "gives an error message when incorrect origin" do
    VCR.use_cassette("bad roadtrip credentials") do
      user = User.create(email: "asdf@gmail.com", password: "asdfasdf", password_confirmation: "asdfasdf", api_key: "asdfasdfasdf")
      post '/api/v1/road_trip', params: {origin: "denveasdf", destination: "boulder,co", api_key: "#{user.api_key}"}

      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:error]).to eq("Incorrect city/state combination")
    end
  end
  it "gives an error message when incorrect destination" do
    VCR.use_cassette("bad roadtrip destination credentials") do
      user = User.create(email: "asdf@gmail.com", password: "asdfasdf", password_confirmation: "asdfasdf", api_key: "asdfasdfasdf")
      post '/api/v1/road_trip', params: {origin: "boulder,co", destination: "asdf", api_key: "#{user.api_key}"}

      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:error]).to eq("Incorrect city/state combination")
    end
  end
  it "gives an error message when incorrect credentials" do
    VCR.use_cassette("bas user credentials") do
      user = User.create(email: "asdf@gmail.com", password: "asdfasdf", password_confirmation: "asdfasdf", api_key: "asdfasdfasdf")
      post '/api/v1/road_trip', params: {origin: "boulder,co", destination: "asdf", api_key: "1234"}

      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:error]).to eq("Invalid API key")
    end
  end
  it "gives an error when no API key passed in" do
    VCR.use_cassette("no api key") do
      user = User.create(email: "asdf@gmail.com", password: "asdfasdf", password_confirmation: "asdfasdf", api_key: "asdfasdfasdf")
      post '/api/v1/road_trip', params: {origin: "boulder,co", destination: "asdf"}

      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:error]).to eq("Provide an API Key")
    end
  end
end
