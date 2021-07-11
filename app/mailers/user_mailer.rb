class UserMailer < ApplicationMailer
  def login(user)
    @user = user
    mail(to: @user.email, subject: 'Check out the mail to login!')
  end
end
