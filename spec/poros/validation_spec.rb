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
  it "returns false if numbers or other types of characters" do

    validation = Validation.new("1234,1234")
    expect(validation.response).to eq(false)
  end
  it "returns false if numbers or other types of character without comma" do

    validation = Validation.new("12341234")
    expect(validation.response).to eq(false)
  end
end
