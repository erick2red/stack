class FilesController < ApplicationController
  respond_to :json

  def index
    respond_to :html
  end

  def list
    @files = Array.new
    Dir.new('/tmp/').each { |i| @files << i }

    render :json => { :answer => 0, :data => @files } , :status => 200
  end
end
