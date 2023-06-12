# frozen_string_literal: true

class AuthenticationController < ApplicationController
  skip_before_action :authenticate_user

  def login
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      token = encode(user_id: @user.id)
      render json: { token: token }, status: :ok
    else
      render json: { error: :unauthorized}, status: :unauthorized
    end
  end
end
