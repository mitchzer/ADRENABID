class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
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
