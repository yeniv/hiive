class LikePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.product.user != user
  end

  def destroy?
    record.user == user
  end
end
