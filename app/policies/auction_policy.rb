class AuctionPolicy < ApplicationPolicy

  def show
   # true
  end

  def create?
    # record
    # user
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
      # scope.where(user: user)
    end
  end

end

