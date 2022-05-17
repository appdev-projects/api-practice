json.extract! comment, :id, :body, :author_id, :photo_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
json.author comment.author
