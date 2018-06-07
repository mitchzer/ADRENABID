class BidPolicy < ApplicationPolicy

  def index
    user_admin?
  end

  # def show?
  #    record.user == user || user_admin?
  # end

  def create?
    # record
    # user
    true
  end

  def update?
    false
  end

  def destroy?
    false
  end

  class Scope < Scope
    def resolve
      scope.all
      # For a multi-tenant SaaS app, you may want to use:
    end
  end

end

