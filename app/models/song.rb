class Song < ActiveRecord::Base
	serialize :folder

    has_many :inspirations, as: :inspirable

	has_many :elements, as: :elementable 

	has_many :presentations, as: :presentable

	has_one :production, as: :productionable

	def clean_link
		link = ""
		begin
			if self.link.include? "watch?v="
				link = self.link.split("watch?v=")[1]
			elsif self.link.include? "youtu.be/"
				link = self.link.split("tu.be/")[1]
			end
		rescue

			return link
		end
	end

	# 

	def has_chords
		if self.folder.present? 
			if self.folder["sections"].present? && self.folder["sections"].count > 0
				self.folder["sections"].each do |s|
					if s["chords"].present?
						return true
					end
				end
			end
		end
		return false
	end

	def self.ready
		array = []
		Song.all.each do |s|
			if s.has_chords
				array.push(s.id)
			end
		end
		return Song.where(id: array)
	end
end
