class HomeController < ApplicationController
  def index
  	@albums = Album.all
  	@album = @albums.first
  	@photo = @albums.first.photos.first
  end

end
