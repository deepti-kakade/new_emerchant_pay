# frozen_string_literal: true

class MerchantPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def show?
    true
  end

  def edit?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
