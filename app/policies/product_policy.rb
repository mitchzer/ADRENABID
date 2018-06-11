class ProductPolicy < ApplicationPolicy

  def index
    user_admin?
  end

  def show?
    user_admin?
  end

  def new?
    user_admin?
  end

  def create?
    user_admin?
  end

  def edit?
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
      scope.all
      # For a multi-tenant SaaS app, you may want to use:
    end
  end

end

