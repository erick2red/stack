class UsersController < ApplicationController
  respond_to :json
  skip_before_filter :authorize, :only => [:create]

  def create
    @user = User.new(params[:user])

    if @user.save
      render :json => { :answer => 0 }, :status => 200
    else
      render :json => { :answer => -3, :message => @user.errors.full_messages }, :status => :unprocessable_entity
    end
  end

  def delete
    @user = User.find_by_id(params[:id])
    @user.destroy

    render :json => { :answer => 0 }, :status => 200
  end

  def update
    @user = User.find_by_id(params[:id])

    if @user.update_attributes(params[:user])
      render :json => { :answer => 0 }, :status => 200
    end
  end

  def enable
    @user = User.find_by_id(params[:id])
    @user.enabled = true

    if @user.save
      render :json => { :answer => 0 }, :status => 200
    else
      render :json => { :answer => -3, :message => @user.errors.full_messages }, :status => :unprocessable_entity
    end
  end

  def disable
    @user = User.find_by_id(params[:id])
    @user.enabled = false

    if @user.save
      render :json => { :answer => 0 }, :status => 200
    else
      render :json => { :answer => -3, :message => @user.errors.full_messages }, :status => :unprocessable_entity
    end
  end
end
