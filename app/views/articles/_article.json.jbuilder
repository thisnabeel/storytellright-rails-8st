json.extract! article, :id, :title, :body, :tags, :cover, :user_id, :visibility, :slug, :created_at, :updated_at
json.url article_url(article, format: :json)
