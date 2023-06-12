# frozen_string_literal: true

class User < ApplicationRecord
  require "securerandom"
  
  # We can use devise gem for the authentication.
  has_secure_password
  
  enum status: [
    :active,
    :inactive
  ]
end
