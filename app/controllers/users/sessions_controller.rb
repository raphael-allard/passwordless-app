class Users::SessionsController < ApplicationController
  def auth
    token = params[:token]
    user = User.find_by(id: params[:user_id])

    if !user || !user.valid_token?(token)
      redirect_to root_path, notice: "It seems your link is invalid. Try requesting for a new login link"
    elsif user.login_token_expired?
      redirect_to root_path, notice: "Your login link has been expired. Try requesting for a new login link"
    else
      sign_in_user(user)
      redirect_to root_path, notice: "You have been signed in!"
    end
  end

  def new
  end

  def create
    value = params[:value]
    user = User.find_user_by(value)
  
    if !user
      redirect_to new_users_session_path, notice: "Uh oh! We couldn't find the username / email. Please try again."
    else
      user.send_login_link
      redirect_to root_path, notice: "We have sent you the link to login to our app"
    end
  end

  def destroy
    session[:email] = nil
    redirect_to root_path, notice: "You have been logged out!"
  end
end
