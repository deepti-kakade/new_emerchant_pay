# frozen_string_literal: true

class Merchant < User
  has_many :transactions
end
