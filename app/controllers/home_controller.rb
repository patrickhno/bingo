class HomeController < ApplicationController
  def index
  	@albums = Album.all
  end

end
