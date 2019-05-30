class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    user ? true : false
  end

  def show?
    true
  end

  def create?
    user ? true : false
  end

  def update?
    record.user == current_user
  end

  def destroy?
    record.user == user
  end
end
