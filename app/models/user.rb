# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  enum status: { inactive: 0, active: 1 }

  def admin?
    type == 'Admin'
  end

  def merchant?
    type == 'Merchant'
  end
end
