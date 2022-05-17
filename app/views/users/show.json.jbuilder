json.cache! @user.updated_at do
  json.extract! @user, :username, :id

  json.feed do
    json.array! @user.feed, partial: "photos/photo", as: :photo
  end
end
