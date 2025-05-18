class PagesController < ApplicationController
	def home
		if user_signed_in?
			redirect_to "/stories"
		end
	end

	def landing
	end

	def circle
	end

	def test
	end

	def screenwriter
	end

	def jokes
	end

	def show
		render json: Page.find_by_slug(:slug)
	end

	def essays
	end

	def presentation
		@story = Story.find(params[:id])
	end


	def page_edit
		page = Page.find_by_slug(params[:slug]) || Page.create(slug: params[:slug])
		page.update(body: params[:body])
		render json: page
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_negative_trait
	  @negative_trait = NegativeTrait.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def page_params
	  params.require(:page).permit!
	end
end