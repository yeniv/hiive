class ProfilePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def private_profile?
    user ? true : false
  end

  def public_profile?
    true
  end
end
