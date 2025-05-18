json.extract! presentation, :id, :body, :presentable_id, :presentable_type, :created_at, :updated_at
json.title presentation.presentable.try(:title) || presentation.presentable.home.try(:title)
json.url presentation_url(presentation, format: :json)
