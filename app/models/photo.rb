class Photo < ApplicationRecord
  has_many :comments,
    dependent: :destroy

  has_many :likes,
    dependent: :destroy

  belongs_to :owner,
    class_name: "User",
    counter_cache: :own_photos_count

  # Indirect associations

  has_many :followers,
    through: :owner,
    source: :followers
end
