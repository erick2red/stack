class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery

  protected
    def authorize
      respond_to do |format|
        unless User.find_by_id_and_enabled(session[:user_id], true)
          format.html { redirect_to login_url, :notice => "Please log in" }
          format.json { render :json => { :answer => -1, :message => 'You are not logged. Please log' }, :status => 401 }
        end
      end
    end
end
