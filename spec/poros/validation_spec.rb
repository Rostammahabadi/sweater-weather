require 'rails_helper'
include StatesHelper
describe "validation" do
  it "returns true" do

    validation = Validation.new("denver,co")
    expect(validation.response).to eq(true)
  end

  it "returns false if both wrong" do

    validation = Validation.new("asdf,asdf")
    expect(validation.response).to eq(false)
  end
  it "returns false if no state" do

    validation = Validation.new("asdf")
    expect(validation.response).to eq(false)
  end
end
