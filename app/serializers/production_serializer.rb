class ProductionSerializer < ActiveModel::Serializer
  attributes :id, :productionable_id, :productionable_type, :company_id, :created_at, :updated_at, :production_id, :title, :code, :position, :company, :user_id, :stories, :tasks, :icon, :songs, :jokes, :games

  def stories
    object.productions.where(productionable_type: "Story").map { |p| StorySerializer.new(p.productionable) }
  end

  def tasks
    object.tasks
  end

  def icon
    object.icon
  end

  def songs
    object.productions.where(productionable_type: "Song")
  end

  def jokes
    object.productions.where(productionable_type: "Joke")
  end

  def games
    object.productions.where(productionable_type: "Game")
  end

  def title
    object.productionable.present? ? object.productionable.title : object.title
  end
end
