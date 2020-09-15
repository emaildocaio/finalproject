class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
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

  def dashboard?
    true
  end

  def bookings_chart? 
    true
  end

  def products_chart? 
    true
  end
end
