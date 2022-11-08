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
  
  def proposal (users,proposal)
    @proposal = proposal
    @user = User.find(users.id)

    mail to: @user.email
  end

  def accept (users,product)
    @product = product
    @user = User.find(users.id)

    mail to: @user.email
  end

  def reject (users,product)
    @product = product
    @user = User.find(users.id)

    mail to: @user.email
  end

end
