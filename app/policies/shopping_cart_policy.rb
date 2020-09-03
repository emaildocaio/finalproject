class ShoppingCartPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def pay?
    record.user == user
  end

  def show?
    record.user == user
  end
end
