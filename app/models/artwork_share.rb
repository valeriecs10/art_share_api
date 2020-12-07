class ArtworkShare < ApplicationRecord
  validates :viewer_id, :artwork_id, presence: true
  validates :artwork_id, uniqueness: {
    scope: :viewer_id,
    message: "can't be shared with the same viewer twice"
  }
  validate :not_view_own_artwork

  belongs_to :artwork,
    class_name: :Artwork,
    foreign_key: :artwork_id,
    primary_key: :id 

  belongs_to :viewer,
    class_name: :User,
    foreign_key: :viewer_id,
    primary_key: :id 

  def viewers_own_artwork?
    viewer.id == artwork.artist_id
  end

  def not_view_own_artwork
    if viewers_own_artwork?
      errors[:artwork] << "can't be shared with its own artist"
    end
  end
end