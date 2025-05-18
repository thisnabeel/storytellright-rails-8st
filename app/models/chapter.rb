class Chapter < ActiveRecord::Base
	has_many :chapters
    belongs_to :chapter
    
	after_create :set_position

	after_commit :flush_cache

	after_create :make_slug

	  
	# Find all skills and check if they have slug
	def self.make_slugs
		Chapter.where(slug: nil).each do |s|
			s.make_slug
		end
	end

	def make_slug
		if !self.slug.present?
			title = self.title.parameterize
			while !self.update(slug: title)
				title = "#{self.title.parameterize}-#{self.id}"
			end
		end
	end

  	def self.all_cached
        return Rails.cache.fetch('chapters') {
            Chapter.all.order("position ASC").to_json( :include => [:chapters])
        }
    end

	def set_position
		begin 
			chapters_list = self.book.chapters
			if chapters_list.count > 1 && chapters_list.present?
				self.update_attributes(position: chapters_list.count)
			else
				self.update_attributes(position: 1)
			end
		rescue
		end
    end
    
	def tree
		tree = []

	    if self.chapter.present?
	      tree.push(self.chapter)

	      while tree.last.chapter.present?
	        tree.push(tree.last.chapter)
	      end
	    else
	      tree = []
	    end

	    return tree.reverse
	end


	# 
	def children
        self.chapters.order("position ASC") | self.chapters.order("position ASC").map(&:children).flatten
    end


    # 
	def grey
		if self.post.present?
			if self.post == "<p><br></p>" || self.post == ""
				return true
            else
                return false
            end
        else
            return true
        end
    end
    
	private
        
    def flush_cache
        Rails.cache.delete('chapters')
    end

end
