class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    (product.user != current_user) && (user ? true : false)
  end

  def destroy?
    record.user == current_user
  end
end
