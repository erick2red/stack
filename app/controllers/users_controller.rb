class UsersController < ApplicationController
  respond_to :json
  skip_before_filter :authorize, :only => [:create]

  def create
    @user = User.new params[:user]
    @user.password = params[:password]

    if @user.save
      Notifications.activate_account(@user).deliver

      render :json => { :answer => 0 }
    else
      render :json => { :answer => -3, :message => @user.errors.full_messages }
    end
  end

  def show
    @user = User.find_by_id params[:id]
    if @user.nil?
      render :json => { :answer => -4, :message => I18n.t(:user_not_found) }
    else
      render :json => { :answer => 0, :data => @user }
    end
  end

  def delete
    @user = User.find_by_id params[:id]
    if @user.nil?
      render :json => { :answer => -4, :message => I18n.t(:user_not_found) }
    else
      @user.destroy

      render :json => { :answer => 0 }
    end
  end

  def update
    @user = User.find_by_id params[:id]
    if @user.nil?
      render :json => { :answer => -4, :message => I18n.t(:user_not_found) }
    elsif @user.update_attributes(params[:user])
      render :json => { :answer => 0 }
    end
  end
end
