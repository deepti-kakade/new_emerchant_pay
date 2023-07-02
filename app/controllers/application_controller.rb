# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include JwtToken
  include Pundit::Authorization

  protect_from_forgery with: :null_session

  devise_group :user, contains: [:merchant, :admin]

  def after_sign_in_path_for(resource)
    merchants_path
  end

  # private

  #   def authenticate_user
  #     begin
  #       @current_user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
  #     end
  #   end

  #   def http_auth_header
  #     headers = request.headers
  #     if headers["Authorization"].present?
  #       return headers["Authorization"].split(" ").last
  #     else
  #       raise "Missing token"
  #     end
  #     nil
  #   end

  #   def decoded_auth_token
  #     @decoded_auth_token ||= JwtToken.decode(http_auth_header)
  #   end
end
