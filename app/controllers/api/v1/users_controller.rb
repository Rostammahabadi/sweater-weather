class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(user), adapter: :json, status: 201
    else
      render json: Error.new.user_errors(user)
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

end
