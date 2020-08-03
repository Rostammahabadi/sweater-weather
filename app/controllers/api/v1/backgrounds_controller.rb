class Api::V1::BackgroundsController < ApplicationController
  def index
    render json: BackgroundSerializer.new(get_image)
  end

  private

  def background_params
    params.permit(:location)
  end

  def get_image
    Background.new(background_params[:location])
  end
end
