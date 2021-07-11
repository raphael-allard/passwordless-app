class Users::SessionsController < ApplicationController
  def auth
    token = params[:token].to_s
    user = User.find_by(id: params[:user_id])
  
    if !user || !user.valid_token?
      redirect_to root_path, notice: 'It seems your link is invalid. Try requesting for a new login link'
    elsif user.login_token_expired?
      redirect_to root_path, notice: 'Your login link has been expired. Try requesting for a new login link.'
    else
      sign_in_user(user)
      redirect_to root_path, notice: 'You have been signed in!'
    end
  end
end
