class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery

  protected
    def authorize
      unless User.find_by_id_and_enabled(session[:user_id], true)
        respond_to do |format|
          format.html { redirect_to login_url, :notice => "Please log in" }
          format.json { render :json => { :answer => -1, :message => t(:not_logged) } }
        end
      end
    end
end
