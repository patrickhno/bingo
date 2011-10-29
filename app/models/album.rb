class Album
  include Mongoid::Document
  field :name,    :type => String
  field :content, :type => String
  embeds_many :photos

  def albums
    @albums ||= Album.all
  end

  def index
    index = nil
    albums.each_with_index do |album,i|
      index = i if album.id == id
    end
    index
  end

  def next
    albums[(index+1)%albums.size]
  end

  def previous
    albums[(index-1)%albums.size]
  end
end
