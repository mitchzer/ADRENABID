class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user
    attachments.inline["final_logo_black.svg"] = File.read("#{Rails.root}/app/assets/images/final_logo_black.svg")
    mail(to: @user.email, subject: 'Welcome to Adrenabid')
  end

  def charging_account(user, order)
    @user = user
    @order = order
    attachments.inline["final_logo_black.svg"] = File.read("#{Rails.root}/app/assets/images/final_logo_black.svg")
    mail(to: @user.email, subject: 'Adrenabid Account Deposit Request.')
  end

  def auction_won(user)
    @user = user
    attachments.inline["final_logo_black.svg"] = File.read("#{Rails.root}/app/assets/images/final_logo_black.svg")
    mail(to: @user.email, subject: 'You just won an auction!')
  end
end
