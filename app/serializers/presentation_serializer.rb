class PresentationSerializer < ActiveModel::Serializer
  attributes :id, :title, :slides

  def slides
    object.slides.map {|slide| SlideSerializer.new(slide)}
  end
end
