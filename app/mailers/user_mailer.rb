class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
   @user = user  # Instance variable => available in view

    mail(to: @user.email, subject: 'Welcome to Adrenabid')
    # This will render a view in `app/views/user_mailer`!
  end

  def charging_account(user, order)
    @user = user
    @order = order
    mail(to: @user.email, subject: 'Adrenabid Account Deposit Request.')
  end

  def auction_won(user)
   @user = user  # Instance variable => available in view

    mail(to: @user.email, subject: 'You just won an auction!')
    # This will render a view in `app/views/user_mailer`!
  end

end
