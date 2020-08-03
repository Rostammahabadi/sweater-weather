class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
    if user.authenticate(params[:password])
      render json: UserSerializer.newc(user)
    else
      render json: {error: user.errors}, status: 400
    end
  end
end
