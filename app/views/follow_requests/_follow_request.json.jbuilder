json.extract! follow_request, :id, :sender_id, :recipient_id, :created_at, :updated_at
json.url follow_request_url(follow_request, format: :json)
