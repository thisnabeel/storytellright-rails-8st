class NegativeTraitsController < ApplicationController
  before_action :set_negative_trait, only: [:show, :edit, :update, :destroy]

  # GET /negative_traits
  # GET /negative_traits.json
  def index
    @negative_traits = NegativeTrait.all
  end

  # GET /negative_traits/1
  # GET /negative_traits/1.json
  def show
  end

  # GET /negative_traits/new
  def new
    @negative_trait = NegativeTrait.new
  end

  # GET /negative_traits/1/edit
  def edit
  end

  # POST /negative_traits
  # POST /negative_traits.json
  def create
    @negative_trait = NegativeTrait.new(negative_trait_params)

    respond_to do |format|
      if @negative_trait.save
        format.html { redirect_to @negative_trait, notice: 'Negative trait was successfully created.' }
        format.json { render :show, status: :created, location: @negative_trait }
      else
        format.html { render :new }
        format.json { render json: @negative_trait.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /negative_traits/1
  # PATCH/PUT /negative_traits/1.json
  def update
    respond_to do |format|
      if @negative_trait.update(negative_trait_params)
        format.html { redirect_to @negative_trait, notice: 'Negative trait was successfully updated.' }
        format.json { render :show, status: :ok, location: @negative_trait }
      else
        format.html { render :edit }
        format.json { render json: @negative_trait.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /negative_traits/1
  # DELETE /negative_traits/1.json
  def destroy
    @negative_trait.destroy
    respond_to do |format|
      format.html { redirect_to negative_traits_url, notice: 'Negative trait was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def test

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_negative_trait
      @negative_trait = NegativeTrait.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def negative_trait_params
      params.require(:negative_trait).permit!
    end
end
