class SessionsController < ApplicationController
  skip_before_filter :authorize, :only => [:new, :create]

  #FIXME: Erase me when everything is up
  def new
  end

  def create
    auth = params[:name].include?('@') ? User.method(:authenticate_by_email) : User.method(:authenticate_by_username)
    if user = auth.call(params[:name], params[:password]) and user.enabled
      session[:user_id] = user.id
      respond_to do |format|
        format.html { redirect_to files_url }
        format.json { render :json => { :answer => 0 }, :status => 200 }
      end
    else
      respond_to do |format|
        format.html { redirect_to login_url }
        format.json { render :json => { :answer => -2, :message => "Wrong authentication credentials" }, :status => 601 }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    respond_to do |format|
      format.html { redirect_to files_url }
      format.json { render :json => { :answer => 0 }, :status => 200}
    end
  end
end
