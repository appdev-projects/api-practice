class FollowRequest < ApplicationRecord
  belongs_to :sender
  belongs_to :recipient
end
