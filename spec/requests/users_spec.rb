require 'rails_helper'

describe "users" do
  it "returns an api key on creation" do
    VCR.use_cassette"returns an api key for user generation" do

      post '/api/v1/users', params: {email: "asdf@gmail.com", password: "asdf", password_confirmation: "asdf"}

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      user = User.last
      expect(json[:data][:type]).to eq("users")
      expect(json[:data][:attributes][:email]).to eq(user.email)
      expect(json[:data][:attributes][:api_key]).to eq(user.api_key)
    end
  end
  it "errors when the email already exists" do
    VCR.use_cassette "return an error message" do

      user = User.create(email: "asdf@gmail.com", password: "asdfasdf", password_confirmation: "asdfasdf", api_key: "asdfasdfasdf")

      post '/api/v1/users', params: {email: "asdf@gmail.com", password: "asdf", password_confirmation: "asdf"}

      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:error][:email]).to eq(["has already been taken"])
    end
  end
  it "errors when the passwords don't match" do
    VCR.use_cassette "returns password error" do

      post '/api/v1/users', params: {email: "asdf@gmail.com", password: "123", password_confirmation: "asdf"}

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:error][:password_confirmation]).to eq(["doesn't match Password"])
    end
  end
  it "errors when the user does not give an e-mail address" do
    VCR.use_cassette "returns error for email" do

      post '/api/v1/users', params: {email: "asdf", password: "asdf", password_confirmation: "asdf"}

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:error][:email]).to eq(["is invalid"])
    end
  end
end
