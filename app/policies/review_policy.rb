class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    user.company != record.product.company
  end

  def create?
    new?
  end
end
