class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
    if !user.nil?
      if user.authenticate(params[:password])
        render json: UserSerializer.new(user)
      else
        render json: {error: "Incorrect password" }, status: 400
      end
    else
      render json: {error: "User does not exist"}, status: 400
    end
  end
end
