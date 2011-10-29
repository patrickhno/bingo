class PhotosController < ApplicationController

  # GET /albums/1/photos/1
  # GET /albums/1/photos/1.json
  def show

  	@album = Album.find(params[:album_id])
    @photo = @album.photos.find(params[:id])

    render :layout => false

    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.json { render json: @photo }
    #end
  end

  # POST /albums/1/photos
  # POST /albums/1/photos.json
  def create
  	@album = Album.find(params[:album_id])
  	@photo = @album.photos.create!(params[:photo])
  	redirect_to @album, :notice => 'Photo created'
  end

  # DELETE /albums/1/photos/1
  # DELETE /albums/1/photos/1.json
  def destroy
  	@album = Album.find(params[:album_id])
    @photo = @album.photos.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to albums_url }
      format.json { head :ok }
    end
  end

end
