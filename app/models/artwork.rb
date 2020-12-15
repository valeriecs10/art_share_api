class Artwork < ApplicationRecord
  validates :title, :image_url, presence: true
  validates :title, uniqueness: { 
    scope: :artist_id,
    message: "cannot be duplicated by same artist"
  }

  belongs_to :artist,
    class_name: :User,
    foreign_key: :artist_id,
    primary_key: :id

  has_many :shares,
    class_name: :ArtworkShare,
    foreign_key: :artwork_id,
    primary_key: :id

  has_many :shared_viewers,
    through: :shares,
    source: :viewer

  has_many :comments,
    class_name: :Comment,
    foreign_key: :artwork_id,
    primary_key: :id,
    dependent: :destroy

  has_many :likes,
    as: :likable

  has_many :likers,
    through: :likes,
    source: :liker
end