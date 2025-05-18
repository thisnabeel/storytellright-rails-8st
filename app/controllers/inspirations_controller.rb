class InspirationsController < ApplicationController
  before_action :set_inspiration, only: [:show, :edit, :update, :destroy]

  # GET /inspirations
  # GET /inspirations.json
  def index
    @inspirations = Inspiration.all
  end

  # GET /inspirations/1
  # GET /inspirations/1.json
  def show
  end

  # GET /inspirations/new
  def new
    @inspiration = Inspiration.new
  end

  # GET /inspirations/1/edit
  def edit
  end

  # POST /inspirations
  # POST /inspirations.json
  def create
    @inspiration = Inspiration.new(inspiration_params)

    respond_to do |format|
      if @inspiration.save
        format.html { redirect_to @inspiration, notice: 'Inspiration was successfully created.' }
        format.json { render :show, status: :created, location: @inspiration }
      else
        format.html { render :new }
        format.json { render json: @inspiration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inspirations/1
  # PATCH/PUT /inspirations/1.json
  def update
    respond_to do |format|
      if @inspiration.update(inspiration_params)
        format.html { redirect_to @inspiration, notice: 'Inspiration was successfully updated.' }
        format.json { render :show, status: :ok, location: @inspiration }
      else
        format.html { render :edit }
        format.json { render json: @inspiration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inspirations/1
  # DELETE /inspirations/1.json
  def destroy
    @inspiration.destroy
    respond_to do |format|
      format.html { redirect_to inspirations_url, notice: 'Inspiration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # 
  def find_inspirations
    i = params[:type].constantize.find(params[:id]).inspirations
    render json: i
  end

  # 
  def search
    @inspirations = nil
    if params[:search] == ""
      @inspirations = Inspiration.where(inspirable_type: params[:inspirable_type]).order("RANDOM()").limit(10)
    else
      @inspirations = 
      Inspiration
      .where('body ILIKE ? OR body ILIKE ?', "%#{params[:search]}%", "%#{params[:search]}%")
      .where(inspirable_type: params[:inspirable_type]) + 
      Inspiration
      .where('tags ILIKE ? OR tags ILIKE ?', "%#{params[:search]}%", "%#{params[:search]}%")
      .where(inspirable_type: params[:inspirable_type])
    end
    render json: @inspirations.uniq.to_json( :include => [:inspirable])
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inspiration
      @inspiration = Inspiration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inspiration_params
      params.require(:inspiration).permit(:location, :body, :inspirable_type, :inspirable_id, :tags, :position)
    end
end
