json.extract! post, :id, :body, :image_data, :created_at, :updated_at
json.url post_url(post, format: :json)
