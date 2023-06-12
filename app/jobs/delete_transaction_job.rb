# frozen_string_literal: true

class DeleteTransactionJob < ApplicationJob
  sidekiq_options retry: false

  def perform
    Transaction.destroy_older_transactions
  end
end
