class ArtworkShare < ApplicationRecord
  validates :viewer_id, :artwork_id, presence: true
  validates :artwork_id, uniqueness: {
    scope: :viewer_id,
    message: "can't be shared with the same viewer twice"
  }

  belongs_to :artwork,
    class_name: :Artwork,
    foreign_key: :artwork_id,
    primary_key: :id 

  belongs_to :viewer,
    class_name: :User,
    foreign_key: :viewer_id,
    primary_key: :id 
end