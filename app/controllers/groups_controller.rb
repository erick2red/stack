class GroupsController < ApplicationController
  respond_to :json

  def create
    @group = Group.new
    @group.name = params[:name]

    if @group.save
      render :json => { :answer => 0 }
    else
      render :json => { :answer => -3, :message => @group.errors.full_messages }
    end
  end

  def show
    @group = Group.find_by_id params[:id]
    if @group.nil?
      render :json => { :answer => -4, :message => I18n.t(:group_not_found) }
    else
      render :json => { :answer => 0, :data => @group }
    end
  end
end
