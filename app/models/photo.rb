
require 'carrierwave/mongoid'

class Photo
  include Mongoid::Document
  field  :name,    :type => String
  field  :content, :type => String
  mount_uploader :image, ImageUploader
  embedded_in :album, :inverse_of => :photos

  def photos
    @photos ||= album.photos.all
  end

  def index
    index = nil
    photos.each_with_index do |photo,i|
      index = i if photo.id == id
    end
    index
  end

  def next
    photos[(index+1)%photos.size]
  end

  def previous
    photos[(index-1)%photos.size]
  end
end
