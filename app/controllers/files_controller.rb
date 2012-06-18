class FilesController < ApplicationController
  def list
    @files = Array.new
    Dir.new('/home/erick/Sources/stock').each { |i| @files << i }
  end
end
