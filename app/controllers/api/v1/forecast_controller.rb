class Api::V1::ForecastController < ApplicationController
  def index
    binding.pry
  end

  private

  def forecast_params
    params.permit(:location)
  end
end
