class StoryFixCard < ActiveRecord::Base
  BUCKETS = %w[elements keep discard].freeze

  belongs_to :story_fix

  validates :bucket, inclusion: { in: BUCKETS }
end
