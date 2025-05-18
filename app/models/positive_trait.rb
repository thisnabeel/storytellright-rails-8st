class PositiveTrait < ActiveRecord::Base
	serialize :details

	def neg_list
		array = []
		self.details["conflicting-traits"].split(", ").each do |t|
			neg = NegativeTrait.find_by_title(t.capitalize)
			if neg
				array.push(neg.title)
			end
		end
		return array
	end
end
