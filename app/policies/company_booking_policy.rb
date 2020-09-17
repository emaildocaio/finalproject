class CompanyBookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def edit?
    true
  end

  def destroy?
    true
  end

  def reactivate?
    true
  end
end
