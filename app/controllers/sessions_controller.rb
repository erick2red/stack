class SessionsController < ApplicationController
  skip_before_filter :authorize, :only => [:new, :create]

  def new
  end

  def create
    auth = params[:name].include?('@') ? User.method(:authenticate_by_email) : User.method(:authenticate_by_username)
    if user = auth.call(params[:name], params[:password])
      session[:user_id] = user.id
      redirect_to files_url
    else
      redirect_to login_url, :alert => "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to files_url, :notice => "Logged out"
  end
end
