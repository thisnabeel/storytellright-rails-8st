class StoryFixesController < ApplicationController
  def show
    render json: board.as_board
  end

  def update
    board.update(
      flawed_belief: params[:flawed_belief],
      thesis: params[:thesis],
      climax: params[:climax]
    )

    incoming = Array(params[:cards]).map do |card|
      card.respond_to?(:permit) ? card.permit(:title, :bucket, :position) : card
    end

    StoryFix.transaction do
      board.lock!
      board.story_fix_cards.delete_all

      seen = {}
      positions = Hash.new(-1)
      incoming.each do |card|
        title = (card[:title] || card['title']).to_s.strip
        next if title.blank?

        bucket = card[:bucket].presence || card['bucket'].presence || 'elements'
        bucket = 'elements' unless StoryFixCard::BUCKETS.include?(bucket)
        key = [bucket, title]
        next if seen[key]

        seen[key] = true
        positions[bucket] += 1
        board.story_fix_cards.create!(
          title: title,
          bucket: bucket,
          position: positions[bucket]
        )
      end
    end

    render json: board.reload.as_board
  end

  private

  def board
    @board ||= StoryFix.find_or_create_by(story_id: params[:story_id])
  end
end
