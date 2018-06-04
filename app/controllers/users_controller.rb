class UsersController < Devise::RegistrationsController
  def create
    super
    if resource.save
      resource.wallet.create!
    end
  end
end
