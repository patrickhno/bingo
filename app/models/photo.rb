
require 'carrierwave/mongoid'

class Photo
  include Mongoid::Document
  field  :name,    :type => String
  field  :content, :type => String
  mount_uploader :image, ImageUploader
  embedded_in :album, :inverse_of => :photos
end
