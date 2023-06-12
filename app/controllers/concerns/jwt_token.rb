# frozen_string_literal: true

require "jwt"

module JwtToken
  extend ActiveSupport::Concern
  ENV["SECRET_KEY_BASE"] = Rails.application.secret_key_base

  def encode(payload, exp = 30.days.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, ENV.fetch("SECRET_KEY_BASE"))
  end

  def decode(token)
    body = JWT.decode(token, ENV.fetch("SECRET_KEY_BASE"))[0]
    HashWithIndifferentAccess.new body
  rescue StandardError => e
    Rails.logger.info "Exception: #{e.message}"
  end
end
