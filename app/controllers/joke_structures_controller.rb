class JokeStructuresController < ApplicationController
  before_action :set_joke_structure, only: [:show, :edit, :update, :destroy]

  # GET /joke_structures
  # GET /joke_structures.json
  def index
    @joke_structures = JokeStructure.all
  end

  # GET /joke_structures/1
  # GET /joke_structures/1.json
  def show
  end

  # GET /joke_structures/new
  def new
    @joke_structure = JokeStructure.new
  end

  # GET /joke_structures/1/edit
  def edit
  end

  # POST /joke_structures
  # POST /joke_structures.json
  def create
    @joke_structure = JokeStructure.new(joke_structure_params)

    respond_to do |format|
      if @joke_structure.save
        format.html { redirect_to @joke_structure, notice: 'Joke structure was successfully created.' }
        format.json { render :show, status: :created, location: @joke_structure }
      else
        format.html { render :new }
        format.json { render json: @joke_structure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /joke_structures/1
  # PATCH/PUT /joke_structures/1.json
  def update
    respond_to do |format|
      if @joke_structure.update(joke_structure_params)
        format.html { redirect_to @joke_structure, notice: 'Joke structure was successfully updated.' }
        format.json { render :show, status: :ok, location: @joke_structure }
      else
        format.html { render :edit }
        format.json { render json: @joke_structure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /joke_structures/1
  # DELETE /joke_structures/1.json
  def destroy
    @joke_structure.destroy
    respond_to do |format|
      format.html { redirect_to joke_structures_url, notice: 'Joke structure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_joke_structure
      @joke_structure = JokeStructure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def joke_structure_params
      params.require(:joke_structure).permit(:title, :description)
    end
end
