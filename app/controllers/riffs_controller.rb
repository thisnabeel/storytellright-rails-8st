class RiffsController < ApplicationController
  before_action :set_riff, only: [:show, :edit, :update, :destroy]

  # GET /riffs
  # GET /riffs.json
  def index
    @riffs = Riff.all
  end

  # GET /riffs/1
  # GET /riffs/1.json
  def show
  end

  # GET /riffs/new
  def new
    @riff = Riff.new
  end

  # GET /riffs/1/edit
  def edit
  end

  # POST /riffs
  # POST /riffs.json
  def create
    @riff = Riff.new(riff_params)

    respond_to do |format|
      if @riff.save
        format.html { redirect_to @riff, notice: 'Riff was successfully created.' }
        format.json { render :show, status: :created, location: @riff }
      else
        format.html { render :new }
        format.json { render json: @riff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /riffs/1
  # PATCH/PUT /riffs/1.json
  def update
    respond_to do |format|
      if @riff.update(riff_params)
        format.html { redirect_to @riff, notice: 'Riff was successfully updated.' }
        format.json { render :show, status: :ok, location: @riff }
      else
        format.html { render :edit }
        format.json { render json: @riff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /riffs/1
  # DELETE /riffs/1.json
  def destroy
    @riff.destroy
    respond_to do |format|
      format.html { redirect_to riffs_url, notice: 'Riff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_riff
      @riff = Riff.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def riff_params
      params.require(:riff).permit(:title, :demo, :guide, :tags, :position)
    end
end
