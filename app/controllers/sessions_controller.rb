class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: (params[:session][:username]))
    if user && user.authenticate(params[:session][:password])  
      session[:user_id] = user.id
      flash[:success] = 'Logged in successfuly'
      redirect_to root_path
    else
      flash.now[:error] = "Check your login details and try to log in again"
      render 'new'
    end
  end

   def destroy
    session[:user_id] = nil
    flash[:success] = 'You have logged out'
    redirect_to login_path
  end
  
  private

  def logged_in_redirect 
    if logged_in?
      flash[:error] = 'You are already logged in'
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
  
end