class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
  def edit?
   user.id == record.id
  end

  def create?
   user_signed_in? && user.admin?
  end

  def update?
   user_signed_in? && user.admin?
  end

  def destroy?
   user.admin?
  end
end
