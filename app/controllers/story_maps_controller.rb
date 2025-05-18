class StoryMapsController < ApplicationController
  before_action :set_story_map, only: [:show, :edit, :update, :destroy]

  # GET /story_maps
  # GET /story_maps.json
  def index
    @story_maps = StoryMap.all
  end

  # GET /story_maps/1
  # GET /story_maps/1.json
  def show
  end

  # GET /story_maps/new
  def new
    @story_map = StoryMap.new
  end

  # GET /story_maps/1/edit
  def edit
  end

  # POST /story_maps
  # POST /story_maps.json
  def create
    @story_map = StoryMap.new(story_map_params)

    respond_to do |format|
      if @story_map.save
        format.html { redirect_to @story_map, notice: 'Story map was successfully created.' }
        format.json { render :show, status: :created, location: @story_map }
      else
        format.html { render :new }
        format.json { render json: @story_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /story_maps/1
  # PATCH/PUT /story_maps/1.json
  def update
    respond_to do |format|
      if @story_map.update(story_map_params)
        format.html { redirect_to @story_map, notice: 'Story map was successfully updated.' }
        format.json { render :show, status: :ok, location: @story_map }
      else
        format.html { render :edit }
        format.json { render json: @story_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /story_maps/1
  # DELETE /story_maps/1.json
  def destroy
    @story_map.destroy
    respond_to do |format|
      format.html { redirect_to story_maps_url, notice: 'Story map was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story_map
      @story_map = StoryMap.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_map_params
      params.require(:story_map).permit!
    end
end
