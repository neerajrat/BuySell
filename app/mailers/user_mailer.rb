class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome (users,product)
    @product = product
    @user = User.find(users.id)

    mail to: @user.email
  end
end
