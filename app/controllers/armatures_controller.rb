class ArmaturesController < ApplicationController
  before_action :set_armature, only: [:show, :edit, :update, :destroy]

  # GET /armatures
  # GET /armatures.json
  def index
    @armatures = Armature.all
  end

  # GET /armatures/1
  # GET /armatures/1.json
  def show
  end

  # GET /armatures/new
  def new
    @armature = Armature.new
  end

  # GET /armatures/1/edit
  def edit
  end

  # POST /armatures
  # POST /armatures.json
  def create
    @armature = Armature.new(armature_params)

    respond_to do |format|
      if @armature.save
        format.html { redirect_to @armature, notice: 'Armature was successfully created.' }
        format.json { render :show, status: :created, location: @armature }
      else
        format.html { render :new }
        format.json { render json: @armature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /armatures/1
  # PATCH/PUT /armatures/1.json
  def update
    respond_to do |format|
      if @armature.update(armature_params)
        format.html { redirect_to @armature, notice: 'Armature was successfully updated.' }
        format.json { render :show, status: :ok, location: @armature }
      else
        format.html { render :edit }
        format.json { render json: @armature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /armatures/1
  # DELETE /armatures/1.json
  def destroy
    @armature.destroy
    respond_to do |format|
      format.html { redirect_to armatures_url, notice: 'Armature was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_armature
      @armature = Armature.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def armature_params
      params.require(:armature).permit(:message)
    end
end
