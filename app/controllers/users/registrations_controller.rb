class Users::RegistrationsController < Devise::RegistrationsController
  def create
    generated_password = Devise.friendly_token.first(8)
    username = params[:user][:email].match(/(.+)@(.+)/)[1]
    user = User.new(user_params.merge(password: generated_password, username: username))
    if user.save
      sign_in(:user, user)
      redirect_to auctions_path
    end
  end

  protected

  def user_params
    params.require(:user).permit(:email)
  end

  def after_sign_up_path_for(resource)
    '/auctions'
  end
end
