class FilesController < ApplicationController
  respond_to :json

  def list
    @files = Array.new
    Dir.new('/home/erick/Sources/stock').each { |i| @files << i }

    render :json => { :answer => 0, :data => @files } , :status => 200
  end
end
