class StoriesController < ApplicationController

	def create_story
		if params["prod_id"].present?
			@story = Production.link(Story, story_params, params["prod_id"])
		else
			@story = Story.create(story_params)
		end
		render json: @story.attributes.merge({
			production: @story.production
		})
	end

	def delete_story
		Story.find(params[:id].to_i).destroy
		render json: current_user
	end

	def destroy
		story = Story.find(params[:id].to_i)
		production = story.production
		story.destroy
		production.destroy if production.stories.count < 1
		render json: "Successfully deleted story"
	end

	def search
		puts params[:query]
		stories = Story.where("title ilike ?", "%#{params[:title]}%")
		render json: stories
	end
	# 

	def watch_list
		@stories = Story.all.order("year DESC").where(original: false)
	end

	def essay
		@story = Story.find(params[:id])
	end

	# 

	def read
		@story = Story.find(params[:id])
	end

	def get_hells
		render json: Story.get_hells
	end

	def index


		# authenticate_user!
		# @original = false

		# if !User.is_admin? current_user
		# 	redirect_to "/watch"
		# else 
		# 	@stories = Story.all.order("year DESC").where(original: false)
		# end

		@stories = Story.all.order("year DESC").where(original: false)
		
		respond_to do |format|
			format.html
		    format.json { render json: @stories }
		end
	end

	def harm_ai

		prompt = "
			give me the harms of the following belief: 


			`#{params[:danger].gsub('.Powered by Froala Editor', '')}`

			The format should be json string array:
			[STRING, STRING...]
		"
    	render json: ChatGpt.send(prompt)
	end

	def purpose_ai
		if params[:armature].present?
			prompt = "
				give me a json array (each less than 150 characters) of flawed beliefs in the format 'You will falsely believe that...', and dangers of that flawed belief in the format 'This belief is dangerous because it will make you [insert painful emotion] due to...' that would exist in a character who needs to learn the truth of the heart-proven FALSIFIABLE STATEMENT:
	
				#{params[:armature].gsub('.Powered by Froala Editor', '')}
	
				The format should be:
				[{belief, danger, falsifiable_statement}, {...}]
			"
		elsif params[:flaw].present?
			prompt = "
				give me a json array (each less than 150 characters) of heart-proven truth STATEMENTS for a character who needs to learn the truth of the flawed belief:
	
				#{params[:flaw].gsub('.Powered by Froala Editor', '')}
	
				The format should be:
				[{belief, danger, falsifiable_statement}, {...}]
			"
		else
			prompt = "
				give me a json array (each less than 150 characters) of FALSIFIABLE STATEMENTS, belief being a character's flawed belief, danger of subsribing to that flawed belief, and the heart-proven falsifiable statement being the truth revealing the flaw of the flawed belief:
		
				The format should be:
				[{belief, danger, falsifiable_statement}, {...}]
			"
		end
    	render json: ChatGpt.send(prompt)
	end

	def lead_ai
		prompt = "
			generate a String array: give me abstract profession/person of someone who would most likely falsely believe 
									'#{params[:flaw].gsub('.Powered by Froala Editor', '')}' in a string like '[professional/persona] who [flawed habit] and just wants [ultimate desire]'.
									Range and Sort the characters from lower class to upper class.
			return json format {characters: [String, ...]}
		"

		puts prompt

    	render json: ChatGpt.send(prompt)
	end

	def climax_ai
		prompt = "
			in json format: 
			1. give me an string array of the most touching actions in very few words a '#{params[:lead].gsub('.Powered by Froala Editor', '')}' does after having learned '#{params[:armature].gsub('.Powered by Froala Editor', '')}'
			2. give me an string array of the most tragic things that could happen to '#{params[:lead].gsub('.Powered by Froala Editor', '')}' for not having learned in time '#{params[:armature].gsub('.Powered by Froala Editor', '')}'

			return json format {comedy: [String, ...], tragedy: [String, ...]}
		"

		puts prompt

    	render json: ChatGpt.send(prompt)
	end

	def originals
		authenticate_user!
		@original = true
		@stories = Story.where(original: true, user_id: current_user.id).order("year DESC")
	end

	def update
		authenticate_user!
		@story = Story.find(params[:id])
		respond_to do |format|
		  if @story.update(story_params)

			pusher = Pusher::Client.new(
				app_id: '1113609',
				key: 'e6efc10ac1252fe7b8ab',
				secret: '25b5e41960b683421b39',
				cluster: 'us3',
				encrypted: true
			)

			pusher.trigger("story-#{@story.id}", 'update-story', {
				story: @story,
				writer_id: current_user.id
			})
			

		    format.json { render json: @story }
		  else
		    format.json { render json: @story.errors, status: :unprocessable_entity }
		  end
		end
	end

	def edit_characters
		story = Story.find(params[:id])
		name = params[:name]

		if params[:prev].present?
			prev = params[:prev]
			list = story.characters
			list[name] = list.delete(prev)
			list[name]["description"] = params[:description]
			story.update(characters: list)

			render json: list
		else
			if story.characters.present?
				list = story.characters
			else
				list = {}
			end
			list[name] = {}
			story.update(characters: list)

			render json: list
		end
	end

	def delete_character
		story = Story.find(params[:id])
		prev = params[:prev]
		list = story.characters
		list.delete(prev)
		story.update(characters: list)

		render json: list
	end

	def show
		@story = Story.find(params[:id])
		render json: @story, serializer: StorySerializer
	end

	def acts
	end

	def punchlines
	end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      params.require(:story).permit!
    end

end