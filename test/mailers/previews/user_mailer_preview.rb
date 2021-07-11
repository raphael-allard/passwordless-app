class UserMailerPreview < ActionMailer::Preview
  # http://localhost:3000/rails/mailers/user_mailer/login
  def login
    user = User.first
    UserMailer.login(user)
  end
end
