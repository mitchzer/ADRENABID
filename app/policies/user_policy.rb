class UserPolicy < ApplicationPolicy

  def index
    user_admin?
  end

  def show?
    record == user || user_admin?
  end

  def create?
    user_admin?
  end

  def update?
    user_admin?
  end

  def destroy?
    user_admin?
  end

  class Scope < Scope
    def resolve
      scope.where(id: user.id)

      # For a multi-tenant SaaS app, you may want to use:
      # scope.where(user: user)
    end
  end
end



