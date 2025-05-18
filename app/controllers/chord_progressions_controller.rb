class ChordProgressionsController < ApplicationController
  before_action :set_chord_progression, only: [:show, :edit, :update, :destroy]

  # GET /chord_progressions
  # GET /chord_progressions.json
  def index
    @chord_progressions = ChordProgression.all
  end

  # GET /chord_progressions/1
  # GET /chord_progressions/1.json
  def show
  end

  # GET /chord_progressions/new
  def new
    @chord_progression = ChordProgression.new
  end

  # GET /chord_progressions/1/edit
  def edit
  end

  # POST /chord_progressions
  # POST /chord_progressions.json
  def create
    @chord_progression = ChordProgression.new(chord_progression_params)

    respond_to do |format|
      if @chord_progression.save
        format.html { redirect_to @chord_progression, notice: 'Chord progression was successfully created.' }
        format.json { render :show, status: :created, location: @chord_progression }
      else
        format.html { render :new }
        format.json { render json: @chord_progression.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chord_progressions/1
  # PATCH/PUT /chord_progressions/1.json
  def update
    respond_to do |format|
      if @chord_progression.update(chord_progression_params)
        format.html { redirect_to @chord_progression, notice: 'Chord progression was successfully updated.' }
        format.json { render :show, status: :ok, location: @chord_progression }
      else
        format.html { render :edit }
        format.json { render json: @chord_progression.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chord_progressions/1
  # DELETE /chord_progressions/1.json
  def destroy
    @chord_progression.destroy
    respond_to do |format|
      format.html { redirect_to chord_progressions_url, notice: 'Chord progression was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chord_progression
      @chord_progression = ChordProgression.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chord_progression_params
      params.require(:chord_progression).permit(:title, :progression, :tags, :scale)
    end
end
