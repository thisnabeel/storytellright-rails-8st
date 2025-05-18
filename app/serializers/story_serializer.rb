class StorySerializer < ActiveModel::Serializer
  attributes :id, :title, :story_details, :created_at, :updated_at, :user_id, :original, :year, :writer, :link, :series, :cover, :bookmark, :fable, :pitch, :production_id
end

