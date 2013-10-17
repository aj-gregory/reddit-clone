class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:name], params[:user][:password])

    if @user
      log_in_user!(@user)
      redirect_to users_url
    else
      flash[:errors] = ["Incorrect username or password"]
      render :new
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end

end
