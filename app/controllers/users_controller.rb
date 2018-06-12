class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    authorize @user
    # @auction = Auction.where(status: 2)

    #if @auction.status == 2 && @user = @auction.winning_user
     # authorize @user

  end
end
