json.extract! slide, :id, :presentation_id, :body, :media_url, :body_font_size_desktop, :body_font_size_mobile, :media_size_desktop, :media_size_mobile, :title_font_size_desktop, :title_font_size_mobile, :position, :created_at, :updated_at
json.url slide_url(slide, format: :json)
