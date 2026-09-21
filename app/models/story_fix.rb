class StoryFix < ActiveRecord::Base
  belongs_to :story
  has_many :story_fix_cards, -> { order(:bucket, :position, :id) }, dependent: :destroy

  def as_board
    {
      id: id,
      story_id: story_id,
      flawed_belief: flawed_belief.to_s,
      thesis: thesis.to_s,
      climax: climax.to_s,
      cards: story_fix_cards.map do |card|
        {
          id: card.id,
          title: card.title.to_s,
          bucket: card.bucket,
          position: card.position
        }
      end
    }
  end
end
