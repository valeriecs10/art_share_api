class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :artworks,
    class_name: :Artwork,
    foreign_key: :artist_id,
    primary_key: :id,
    dependent: :destroy

  has_many :artwork_shares,
    class_name: :ArtworkShare,
    foreign_key: :viewer_id,
    primary_key: :id,
    dependent: :destroy

  has_many :viewed_artworks,
    through: :artwork_shares,
    source: :artwork

  has_many :comments,
    class_name: :Comment,
    foreign_key: :user_id,
    primary_key: :id,
    dependent: :destroy
  has_many :likes,
      class_name: :Like,
      foreign_key: :user_id,
      primary_key: :id

  has_many :liked_comments,
    through: :likes,
    source: :likable,
    source_type: "Comment"

  has_many :liked_artworks,
    through: :likes,
    source: :likable,
    source_type: "Artwork"

  def liked_items
    liked_comments + liked_artworks
  end
end