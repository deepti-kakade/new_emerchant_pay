# frozen_string_literal: true

class TransactionsController < ApplicationController

  def create
    if current_user.active
      transaction = Transaction.create(transaction_params)
      render json: { transaction: transaction }, status: :ok
    else
      render json: { error: "Merchant is not active" }, status: :503
    end
  end

  private

    def transaction_params
      params.require(:transaction).permit(:amount, :customer_email, :customer_phone, :status, :user_id)
    end
end
