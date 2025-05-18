class DiscussionQuestion < ActiveRecord::Base
    belongs_to :discussion
    alias_attribute :answers, :discussion_answers
    has_many :discussion_answers, dependent: :destroy

end
