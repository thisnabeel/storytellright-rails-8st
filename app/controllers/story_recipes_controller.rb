class StoryRecipesController < ApplicationController
  before_action :set_story_recipe, only: [:edit, :update, :destroy]

  # GET /story_recipes
  # GET /story_recipes.json
  def index
    @story_recipes = StoryRecipe.all
  end

  # GET /story_recipes/1
  # GET /story_recipes/1.json
  def show
    @story_recipe = StoryRecipe.find(params[:id])
    @recipe = @story_recipe.recipe
    @story = @story_recipe.story
    @recipe_details = @story_recipe.details
  end

  def init_recipe
    @recipe = Recipe.find(params[:recipe_id])
    @story = Story.find(params[:story_id])
    @story_recipe = StoryRecipe.create(story_id: @story.id, recipe_id: @recipe.id, details: @recipe.details)
    redirect_to "/story_recipes/#{@story_recipe.id}"
  end

  # GET /story_recipes/new
  def new
    @story_recipe = StoryRecipe.new
  end

  # GET /story_recipes/1/edit
  def edit
  end

  # POST /story_recipes
  # POST /story_recipes.json
  def create
    @story_recipe = StoryRecipe.new(story_recipe_params)

    respond_to do |format|
      if @story_recipe.save
        format.html { redirect_to @story_recipe, notice: 'StoryRecipe was successfully created.' }
        format.json { render :show, status: :created, location: @story_recipe }
      else
        format.html { render :new }
        format.json { render json: @story_recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /story_recipes/1
  # PATCH/PUT /story_recipes/1.json
  def update
    respond_to do |format|
      if @story_recipe.update(story_recipe_params)
        format.html { redirect_to @story_recipe, notice: 'StoryRecipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @story_recipe }
      else
        format.html { render :edit }
        format.json { render json: @story_recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /story_recipes/1
  # DELETE /story_recipes/1.json
  def destroy
    @story_recipe.destroy
    respond_to do |format|
      format.html { redirect_to story_recipes_url, notice: 'StoryRecipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story_recipe
      @story_recipe = StoryRecipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_recipe_params
      params.require(:story_recipe).permit!
    end
end
