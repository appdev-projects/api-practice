# json.zebra 42
# json.giraffe 16

# json.array! [1, 2, 3]

# json.array! @photos do |photo|
#   json.id photo.id
#   json.image photo.image
#   json.image photo.caption
# end

# json.array! @photos do |photo|
#   json.extract! photo, :id, :image, :caption
# end

# json.array! @photos, :id, :image, :caption

json.array! @photos, partial: "photos/photo", as: :photo