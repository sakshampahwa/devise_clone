class AccountController < ApplicationController
  def signup
    @user = User.new
    if request.post?
      @user = User.new(user_params)
      if @user.save
        UserNotifierMailer.signup_alert(@user).deliver
        render :action=>"login"
      else
        render :action=>"signup"
      end
    end
  end

  def login
    if request.post?
      @user = User.authenticate(params[:email],params[:password])
      if @user
        session[:user] = @user.id
        redirect_to :action=>:dashboard
      else
        flash[:notice] = "Invalid Credentials"
        render :action=>:login
      end
    end
  end

  def logout
    session.delete(:user)
    redirect_to account_login_url
  end

  def user_params
    params.permit(:firstname,:lastname,:email,:password,:password_confirmation,:encrypted_password)
  end
end
