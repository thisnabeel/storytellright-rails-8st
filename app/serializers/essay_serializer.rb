class EssaySerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :position
  has_one :essay
end
