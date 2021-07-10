class Users::RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      @user.send_login_link
      redirect_to root_path, notice: "Welcome! We have sent you the link to login to our app."
    else
      render :new
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:email, :username)
  end
end
