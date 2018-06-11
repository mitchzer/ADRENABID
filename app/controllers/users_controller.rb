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


#   def edit
#     @user = User.find(params[:id])
#   end

#   def update
#     @user = User.new(user_params)
#     if @user.save
#       redirect_to user_path(@user)
#     else
#       render :edit
#     end
#   end

# private

#   def user_params
#     params.require(:user).permit(:address)
#   end
end
