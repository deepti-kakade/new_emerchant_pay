# frozen_string_literal: true

class MerchantPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def show?
    user.admin? || (user.merchant? && user.id == record.id)
  end

  def edit?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
