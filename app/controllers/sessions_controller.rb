class SessionsController < ApplicationController
  respond_to :json
  skip_before_filter :authorize, :only => [:new, :create]

  def new
    respond_to :html
  end

  def create
    unless params.has_key? :name and params.has_key? :password
      render :json => { :answer => -5, :message => I18n.t(:malformed_params) }
    else
      if user = User.authenticate(params[:name], params[:password]) and user.enabled
        session[:user_id] = user.id
        render :json => { :answer => 0 }, :status => 200
      else
        render :json => { :answer => -2, :message => I18n.t(:wrong_auth) }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    render :json => { :answer => 0 }
  end
end
