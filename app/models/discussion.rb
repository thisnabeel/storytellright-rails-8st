class Discussion < ActiveRecord::Base
    belongs_to :club
    serialize :questions
    serialize :answers

    alias_attribute :questions, :discussion_questions
    has_many :discussion_questions, dependent: :destroy


end
