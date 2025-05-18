class ProductionsController < ApplicationController
  before_action :set_production, only: [:edit, :update, :destroy]

  # GET /productions
  # GET /productions.json
  def index
    if Production.find_by(code: params[:code]).present? && params[:code].present?
      @production = Production.find_by(code: params[:code])
      @productions = Production.find_by(code: params[:code]).children
    else
      @productions = current_user.productions
    end
  end

  # GET /productions/1
  # GET /productions/1.json
  def show
    @production = Production.find_by(code: params[:id])
    render json: @production, serializer: ProductionSerializer
  end

  # GET /productions/new
  def new
    @production = Production.new
  end

  # GET /productions/1/edit
  def edit
  end

  # POST /productions
  # POST /productions.json
  def create
    @production = Production.new(production_params)

    respond_to do |format|
      if @production.save
        if @production.productionable_type.present?
          item = @production.productionable_type.constantize.create(
            title: @production.title,
            original: true
          )
          @production.update(productionable_id: item.id)
        end
        format.html { redirect_to @production, notice: 'Production was successfully created.' }
        format.json { render :show, status: :created, location: @production }
        format.js { render layout: false  }
      else
        format.html { render :new }
        format.json { render json: @production.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productions/1
  # PATCH/PUT /productions/1.json
  def update
    respond_to do |format|
      if @production.update(production_params)
        format.html { redirect_to @production, notice: 'Production was successfully updated.' }
        format.json { render :show, status: :ok, location: @production }
      else
        format.html { render :edit }
        format.json { render json: @production.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productions/1
  # DELETE /productions/1.json
  def destroy
    @production.destroy
    respond_to do |format|
      format.html { redirect_to productions_url, notice: 'Production was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def config_productions
    # Get List Array
    list = params[:list]

    puts list

    # Each Production
    list.each do |t|
      # Find Production
      production = Production.find(t["id"])
      # production.update(production_id: nil)
      production.update(
        position: t["position"],
        production_id: t["belongs"],
      )
    end

    render status: 200, json: {
      message: "Successfully saved map!",
    }.to_json
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_production
      @production = Production.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def production_params
      params.require(:production).permit!
    end
end
