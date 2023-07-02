# frozen_string_literal: true

class Transaction < ApplicationRecord

  belongs_to :merchant, class_name: 'User'

  enum status: [
    :approved,
    :reversed,
    :refunded,
    :error
  ]
  
  validates :amount, numericality: { greater_than: 0 }
  validates :customer_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :status, presence: true

  scope :one_hour_older, -> {
    where("created_at <= ?", (Time.now - 1.hour))
  }

  class << self
    def destroy_older_transactions
      # We can use detsroy_all if we want to execute callbacks.
      one_hour_older.delete_all 
    end
  end
end
