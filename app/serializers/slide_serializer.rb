class SlideSerializer < ActiveModel::Serializer
  attributes :id, :left, :top, :media_url, :presentation_id, :body, :media_url, :body_font_size_desktop, :body_font_size_mobile, :media_size_desktop, :media_size_mobile, :title_font_size_desktop, :title_font_size_mobile, :position

  def left
    return 0
  end

  def top
    return 0
  end
end
