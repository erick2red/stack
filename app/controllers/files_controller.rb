class FilesController < ApplicationController
  def list
    @files = Array.new
    Dir.new('/home/erick/Sources/stock').each { |i| @files << i }

    respond_to do |format|
      format.html
      format.json { render :json => { :answer => 0, :data => @files } , :status => 200 }
    end
  end
end
