class JokesController < ApplicationController



	def index
		authenticate_user!
		@original = false

		if !User.is_admin? current_user
		  redirect_to "/laugh"
		else 
		  @jokes = Joke.all.order("year DESC").where(original: false)
		end
	end

  	# 
	def laugh
		@jokes = Joke.all.order("year DESC").where(original: false)
	end

	def originals
	    authenticate_user!
	    @original = true
	    @jokes = Joke.where(original: true, user_id: current_user.id).order("year DESC")
	end

	def create_joke
		@user = current_user
		@joke = Joke.create(
			title: params[:title],
			user_id: params[:user_id]
		)
		render json: @joke
	end

	def delete_joke
		Joke.find(params[:id].to_i).destroy
		render json: current_user
	end


	def update
		@joke = Joke.find(params[:id])
		respond_to do |format|
		  if @joke.update(joke_params)
		    format.json { render json: @joke }
		  else
		    format.json { render json: @joke.errors, status: :unprocessable_entity }
		  end
		end
	end

	def edit_characters
		joke = Joke.find(params[:id])
		name = params[:name]

		if params[:prev].present?
			prev = params[:prev]
			list = joke.characters
			list[name] = list.delete(prev)
			list[name]["description"] = params[:description]
			joke.update(characters: list)

			render json: list
		else
			if joke.characters.present?
				list = joke.characters
			else
				list = {}
			end
			list[name] = {}
			joke.update(characters: list)

			render json: list
		end
	end

	def delete_character
		joke = Joke.find(params[:id])
		prev = params[:prev]
		list = joke.characters
		list.delete(prev)
		joke.update(characters: list)

		render json: list
	end

	def show
		@joke = Joke.find(params[:id])
	end

	def acts
	end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def joke_params
      params.require(:joke).permit!
    end

end