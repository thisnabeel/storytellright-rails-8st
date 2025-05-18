class Visual < ActiveRecord::Base
    serialize :details
	has_many :inspirations, as: :inspirable
	
	has_many :presentations, as: :presentable

	def check(item)
		if self.details.present? 
			if self.details[item].present? && self.details[item] != "" && self.details[item] != "<p><br></p>" && self.details[item] != nil
				return self.details[item]
			end
		else
			return false
		end
	end
end