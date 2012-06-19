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

  def show
    @user = User.find_by_id(params[:id])
    if @user == nil
      render :json => { :answer => -4, :message => "User not found" }, :status => :unprocessable_entity
    else
      render :json => { :answer => 0, :data => @user }, :status => 200
    end
  end

  def delete
    @user = User.find_by_id(params[:id])
    if @user == nil
      render :json => { :answer => -4, :message => "User not found" }, :status => :unprocessable_entity
    else
      @user.destroy

      render :json => { :answer => 0 }, :status => 200
    end
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user == nil
      render :json => { :answer => -4, :message => "User not found" }, :status => :unprocessable_entity
    elsif @user.update_attributes(params[:user])
      render :json => { :answer => 0 }, :status => 200
    end
  end
end
