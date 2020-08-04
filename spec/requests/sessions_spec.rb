require 'rails_helper'

describe "sessions" do
  it "returns the api key for the user" do
    VCR.use_cassette("api key return") do
      user = User.create(email: "asdf@gmail.com", password: "asdfasdf", password_confirmation: "asdfasdf", api_key: "asdfasdfasdf")

      post '/api/v1/sessions', params: {email: "#{user.email}", password: "#{user.password}"}

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(json[:data][:id]).to eq("#{user.id}")
      expect(json[:data][:type]).to eq("users")
      expect(json[:data][:attributes][:email]).to eq("#{user.email}")
      expect(json[:data][:attributes][:api_key]).to eq("#{user.api_key}")
    end
  end
  it "errors out when the email is not in the database" do
    VCR.use_cassette("error return for no email") do

      post '/api/v1/sessions', params: {email: "asdf@gmail.com", password: "asdf"}
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:error]).to eq("User does not exist")
    end
  end
  it "errors out when the password doesn't match the one in the db" do
    VCR.use_cassette("error return when email doesn't match") do
      user = User.create(email: "asdf@gmail.com", password: "asdfasdf", password_confirmation: "asdfasdf", api_key: "asdfasdfasdf")
      post '/api/v1/sessions', params: {email: "#{user.email}", password: "123"}

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:error]).to eq("Incorrect password")
    end
  end
end
