class ApplicationController < ActionController::Base
  before_action :current_user

  def sign_in_user(user)
    user.expire_token!
    session[:email] = user.email
  end
  
  def current_user
    @current_user = User.find_by(email: session[:email])
  end
end
