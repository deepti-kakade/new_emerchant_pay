# frozen_string_literal: true

class Api::V1::AuthenticationController < Api::V1::BaseController
  skip_before_action :authenticate_user

  # http://localhost:3000/auth/login
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
