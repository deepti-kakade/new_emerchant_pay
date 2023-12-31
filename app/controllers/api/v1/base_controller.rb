class Api::V1::BaseController < ActionController::Base
  include JWTSessions::RailsAuthorization

  protect_from_forgery with: :null_session

  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized

  private

  def authenticate_user
    begin
      @current_user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    end
  end

  def http_auth_header
    headers = request.headers
    if headers["Authorization"].present?
      return headers["Authorization"].split(" ").last
    else
      raise "Missing token"
    end
    nil
  end

  def decoded_auth_token
    @decoded_auth_token ||= JwtToken.decode(http_auth_header)
  end
end
