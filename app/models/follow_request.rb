class FollowRequest < ApplicationRecord
  belongs_to :recipient,
             class_name: "User",
             counter_cache: :received_follow_requests_count

  belongs_to :sender,
             class_name: "User",
             counter_cache: :sent_follow_requests_count

  validates :recipient_id,
             uniqueness: { scope: [:sender_id], message: "already requested" }
end
