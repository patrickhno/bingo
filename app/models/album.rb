class Album
  include Mongoid::Document
  field :name,    :type => String
  field :content, :type => String
  embeds_many :photos
end
