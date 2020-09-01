class ProductPolicy < ApplicationPolicy
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

    def edit?
      record.company.user == user
    # - record: the restaurant passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
    end

    def update?
      edit?
      # - record: the restaurant passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
    end

    def destroy?
    end

    def my_index?
    end

    def show?
    end
end
