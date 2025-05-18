class Story < ActiveRecord::Base
	belongs_to :user
	attribute :characters, :json, default: {}
	# attribute :story_details, :json, default: {}
	# serialize :story_details, ActiveRecord::Coders::YAMLColumn.new(Hash)


	after_create :init_story

	has_one :production, as: :productionable

	has_many :story_recipes

	has_many :inspirations, as: :inspirable
	
	has_many :presentations, as: :presentable

	# include Writing

	def init_story
		if self.story_details == nil 
			self.update(story_details: {})
		end
	end

	def check(item)
		if self.story_details.present? 
			if self.story_details[item].present? && self.story_details[item] != "" && self.story_details[item] != "<p><br></p>" && self.story_details[item] != nil
				return self.story_details[item]
			end
		else
			return false
		end
	end

	def prereqs(*things)
		output = 1
		if self.story_details.present?
			things.each do |thing|
				if self.story_details[thing].present? && self.story_details[thing] != "<p><br></p>"
					output = 1
				else
					return false
				end
			end
		else
			return false
		end
	end

	def self.prereqs(*things)
		array = []
		Story.all.where(original: false).order("year ASC").each do |story|
			output = 0
			if story.story_details.present?
				# puts "searching #{story.title}"
				things.each do |thing|
					if story.story_details[thing].present? && story.story_details[thing] != "<p><br></p>"
						output += 1
					else
					end
				end
			else
			end

			if output == things.count
				array.push(story.id)
			end

		end
		return Story.where(id: array).order("year ASC")
	end

	def self.original_prereqs(*things)
		array = []
		Story.all.where(original: true, user_id: User.first.id).order("year ASC").each do |story|
			output = 0
			if story.story_details.present?
				# puts "searching #{story.title}"
				things.each do |thing|
					if story.story_details[thing].present? && story.story_details[thing] != "<p><br></p>"
						output += 1
					else
					end
				end
			else
			end

			if output == things.count
				array.push(story.id)
			end

		end
		return Story.where(id: array).order("year ASC")
	end

	def self.acts_ready
		list = []
		Story.all.order("year ASC").each do |s|
			if s.story_details.present?
				armature = s.story_details["armature"]
				act_1_skeleton = s.story_details["act-1-skeleton"]
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
		Story.all.where(original: false).order("year ASC").each do |s|
			if s.story_details.present?
				armature = s.story_details["armature"]
				if armature.check_text?
					list.push(s)
				end
			else
			end
		end
		return list
	end

	# hunt
	def self.hunt(code)
		list = []
		Story.all.where(original: false).order("year ASC").each do |s|
			if s.story_details.present? && s.story_details[code].present?
				item = s.story_details[code]
				if item.check_text?
					list.push(s)
				end
			else
			end
		end
		return list
	end

	# 

	def self.get_hells
		return Story.prereqs("bonfire-deny-accept-2", "climax", "plot-curtain", "whose-hell", "during", "during-2", "red-3")
	end
end