class StoryRecipe < ActiveRecord::Base
	serialize :details
	belongs_to :recipe
	belongs_to :story
end
