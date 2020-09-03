class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def destroy?
    record.shopping_cart.user == user
  end

  def edit?
    destroy?
  end

  def update?
    edit?
  end
end
