class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super
    if resource.save
      resource.create_wallet
    end
  end

  protected

  def after_sign_up_path_for(resource)
    '/auctions'
  end

end
