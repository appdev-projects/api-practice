json.extract! photo, :id, :caption, :image, :owner_id, :comments_count, :created_at, :updated_at
json.url photo_url(photo, format: :json)
json.liked photo.liked_by(api_user)