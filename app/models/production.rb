class Production < ActiveRecord::Base

    belongs_to :productionable, polymorphic: true
    belongs_to :user
    belongs_to :company

    has_many :tasks, dependent: :destroy
    has_many :productions, dependent: :destroy

    has_many :production_users, dependent: :destroy
    has_many :users, through: :production_users

    before_destroy :destroy_parent
    after_create :update_code

    def self.link(prod_type, prod_params, prod_id)
        prod = prod_type.create(prod_params)
        Production.create(
            productionable_type: prod.class.name, 
            productionable_id: prod.id,
            production_id: prod_id,
            title: prod.title
        )
        return prod
    end

    def update_code
        if self.code.present?
            return self.code
        else
            new_code = generate_code
            self.update(code: new_code)
            return new_code
        end
    end

    def destroy_parent
        # if self.productionable.present?
        #     # self.productionable.destroy
        # end
    end

    def href
        production = self
        if production.productionable_type.present?
            return "/#{production.productionable_type.underscore.pluralize}/#{production.productionable_id}" if production.productionable_type.present?
        else 
            return "/#{production.code}"
        end
    end

    def icon
        case self.productionable_type
        when "Story"
            return "fa-film"
        when "Song"
            return "fa-music"
        when "Joke"
            return "fa-smile-o"
        when "Game"
            return "fa-gamepad"
        when "Visual"
            return "fa-image"
        else
            return "fa-building"
        end
    end

    def all_tasks
        self.tasks + self.productions
        array = self.tasks.pluck(:id)
        self.productions.each do |p|
            p.tasks.each do |t|
                array.push(t.id)
            end
        end
        return Task.where(id: array)
    end

    def children
		self.productions.order("position ASC") | self.productions.order("position ASC").map(&:children).flatten
    end
    
    def stories
        self.productions.where(productionable_type: "Story")
    end

    def songs
        self.productions.where(productionable_type: "Song")
    end

    def jokes
        self.productions.where(productionable_type: "Joke")
    end

    def games
        self.productions.where(productionable_type: "Game")
    end

    def visuals
        self.productions.where(productionable_type: "Visual")
    end

    def stories_progress
        hash = {
            1 => [],
            2 => [],
            3 => [],
            4 => []
        }
        self.stories.each do |m|
            story = m.productionable
            if story.prereqs( 
                "climax", 
                "plot-curtain", 
                "armature", 
                "red-3", 
                "during", 
                "during-2") 

                hash[4].push(story)
            elsif story.prereqs(
                "armature", 
                "bonfire-deny-accept-1",
                "whose-hell",
                "climax") 

                hash[3].push(story)
            elsif story.prereqs(
                "armature", 
                "bonfire-deny-accept-1",
                ) 

                hash[2].push(story)
            else

                hash[1].push(story)
            end
        end

        return hash
    end


    def songs_progress
        hash = {
            1 => [],
            2 => [],
            3 => [],
            4 => []
        }
        self.songs.each do |m|
            song = m.productionable
            # if song.prereqs( 
            #     "climax", 
            #     "plot-curtain", 
            #     "armature", 
            #     "red-3", 
            #     "during", 
            #     "during-2") 

            #     hash[4].push(song)
            # elsif song.prereqs(
            #     "armature", 
            #     "bonfire-deny-accept-1",
            #     "whose-hell",
            #     "climax") 

            #     hash[3].push(song)
            # elsif song.prereqs(
            #     "armature", 
            #     "bonfire-deny-accept-1",
            #     ) 

            #     hash[2].push(song)
            # else

            #     hash[1].push(song)
            # end
            hash[1].push(song)
        end

        return hash
    end

    private
    def generate_code
        code = rand(36**8).to_s(36)
        while Production.find_by_code(code).present? == true
          code = rand(36**8).to_s(36)
        end
        return code
    end

end
