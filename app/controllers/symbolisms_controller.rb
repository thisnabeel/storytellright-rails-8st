class SymbolismsController < ApplicationController
  before_action :set_symbolism, only: [:show, :edit, :update, :destroy]

  # GET /symbolisms
  # GET /symbolisms.json
  def index
    @symbolisms = Symbolism.all
  end

  # GET /symbolisms/1
  # GET /symbolisms/1.json
  def show
  end

  # GET /symbolisms/new
  def new
    @symbolism = Symbolism.new
  end

  # GET /symbolisms/1/edit
  def edit
  end

  # POST /symbolisms
  # POST /symbolisms.json
  def create
    @symbolism = Symbolism.new(symbolism_params)

    respond_to do |format|
      if @symbolism.save
        format.html { redirect_to @symbolism, notice: 'Negative trait was successfully created.' }
        format.json { render :show, status: :created, location: @symbolism }
      else
        format.html { render :new }
        format.json { render json: @symbolism.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /symbolisms/1
  # PATCH/PUT /symbolisms/1.json
  def update
    respond_to do |format|
      if @symbolism.update(symbolism_params)
        format.html { redirect_to @symbolism, notice: 'Negative trait was successfully updated.' }
        format.json { render :show, status: :ok, location: @symbolism }
      else
        format.html { render :edit }
        format.json { render json: @symbolism.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /symbolisms/1
  # DELETE /symbolisms/1.json
  def destroy
    @symbolism.destroy
    respond_to do |format|
      format.html { redirect_to symbolisms_url, notice: 'Negative trait was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_symbolism
      @symbolism = Symbolism.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def symbolism_params
      params.require(:symbolism).permit!
    end
end
