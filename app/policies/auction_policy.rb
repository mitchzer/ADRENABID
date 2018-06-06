class AuctionPolicy < ApplicationPolicy
  def index

  end

  def show

  end

  def new

  end

  def create
    user_is_admin?
  end

  def edit
    user_is_admin?
  end

  def update
    user_is_admin?
  end

  def delete
    user_is_admin?
  end

  def list_bids(auction)

  end

  private

  def user_is_admin?
    user.admin = true
  end

end

