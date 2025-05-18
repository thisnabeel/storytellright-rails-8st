class Recipe < ActiveRecord::Base
	serialize :details

	after_create :check_type

	def check_type
		if self.recipe_type == nil
			self.update(recipe_type: "regular")
		end
	end
end
