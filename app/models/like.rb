class Like < ApplicationRecord
  belongs_to :fan, class_name: "User"

  belongs_to :photo

  validates :photo_id,
    uniqueness: {scope: [:fan_id], message: "already liked"}
end
