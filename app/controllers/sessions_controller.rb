class SessionsController < ApplicationController
  respond_to :json
  skip_before_filter :authorize, :only => [:new, :create]

  def create
    auth = params[:name].include?('@') ? User.method(:authenticate_by_email) : User.method(:authenticate_by_username)
    if user = auth.call(params[:name], params[:password]) and user.enabled
      session[:user_id] = user.id
      render :json => { :answer => 0 }, :status => 200
    else
      render :json => { :answer => -2, :message => "Wrong authentication credentials" }, :status => 601
    end
  end

  def destroy
    session[:user_id] = nil
    render :json => { :answer => 0 }, :status => 200
  end
end
