json.array!(@blogposts) do |blogpost|
  json.extract! blogpost, :id, :content, :comment_id, :user_id
  json.url blogpost_url(blogpost, format: :json)
end
