class PositiveTraitsController < ApplicationController
  before_action :set_positive_trait, only: [:show, :edit, :update, :destroy]

  # GET /positive_traits
  # GET /positive_traits.json
  def index
    @positive_traits = PositiveTrait.all
  end

  # GET /positive_traits/1
  # GET /positive_traits/1.json
  def show
  end

  # GET /positive_traits/new
  def new
    @positive_trait = PositiveTrait.new
  end

  # GET /positive_traits/1/edit
  def edit
  end

  # POST /positive_traits
  # POST /positive_traits.json
  def create
    @positive_trait = PositiveTrait.new(positive_trait_params)

    respond_to do |format|
      if @positive_trait.save
        format.html { redirect_to @positive_trait, notice: 'Positive trait was successfully created.' }
        format.json { render :show, status: :created, location: @positive_trait }
      else
        format.html { render :new }
        format.json { render json: @positive_trait.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /positive_traits/1
  # PATCH/PUT /positive_traits/1.json
  def update
    respond_to do |format|
      if @positive_trait.update(positive_trait_params)
        format.html { redirect_to @positive_trait, notice: 'Positive trait was successfully updated.' }
        format.json { render :show, status: :ok, location: @positive_trait }
      else
        format.html { render :edit }
        format.json { render json: @positive_trait.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /positive_traits/1
  # DELETE /positive_traits/1.json
  def destroy
    @positive_trait.destroy
    respond_to do |format|
      format.html { redirect_to positive_traits_url, notice: 'Positive trait was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_positive_trait
      @positive_trait = PositiveTrait.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def positive_trait_params
      params.require(:positive_trait).permit!
    end
end
