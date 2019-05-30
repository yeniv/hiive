class LikePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user ? true : false
  end

  def destroy?
    record.user == user
  end
end
