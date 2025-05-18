class Joke < ActiveRecord::Base
	belongs_to :user
	serialize :characters
	serialize :joke_details
	after_create :init_joke

	has_many :joke_recipes

	has_many :inspirations, as: :inspirable
	
	has_many :presentations, as: :presentable

	# include Writing

	def init_joke
		self.update(joke_details: {})
	end

	def check(item)
		if self.joke_details.present? 
			if self.joke_details[item].present? && self.joke_details[item] != "" && self.joke_details[item] != "<p><br></p>" && self.joke_details[item] != nil
				return self.joke_details[item]
			end
		else
			return false
		end
	end

	

	def prereqs(*things)
		output = 1
		if self.joke_details.present?
			things.each do |thing|
				if self.joke_details[thing].present? && self.joke_details[thing] != "<p><br></p>"
					output = 1
				else
					return false
				end
			end
		else
			return false
		end
	end

	def self.acts_ready
		list = []
		Joke.all.order("year ASC").each do |s|
			if s.joke_details.present?
				armature = s.joke_details["armature"]
				act_1_skeleton = s.joke_details["act-1-skeleton"]
				if armature.check_text? && act_1_skeleton.try(:first).try(:check_text?)
					list.push(s)
				end
			else
			end
		end
		return list
	end

	def self.has_armature
		list = []
		Joke.all.where(original: false).order("year ASC").each do |s|
			if s.joke_details.present?
				armature = s.joke_details["armature"]
				if armature.check_text?
					list.push(s)
				end
			else
			end
		end
		return list
	end


end