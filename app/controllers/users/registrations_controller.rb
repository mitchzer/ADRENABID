class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super
    if resource.save
      resource.create_wallet
    end
  end
end
