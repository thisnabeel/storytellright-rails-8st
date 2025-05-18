class PresentationsController < ApplicationController
  before_action :set_presentation, only: [:show, :edit, :update, :destroy]

  # GET /presentations
  # GET /presentations.json
  def index
    @no_sides = true
    @presentations = Presentation.all
    render json: @presentations, each_serializer: PresentationSerializer
  end

  def by_item
    @item = params[:type].capitalize.constantize.find(params[:id])
    @presentations = @item.presentations
  end

  def speech
    if params[:message].present?
      Pusher.trigger('speech', 'client-slide-change', {
        message: params[:message]
      })
      render status: 200, json: {
        message: "Successful!",
      }.to_json

    end
  end

  # GET /presentations/1
  # GET /presentations/1.json
  def show
    render json: @presentation, serializer: PresentationSerializer
  end
  

  # GET /presentations/new
  def new
    @presentation = Presentation.new
  end

  # GET /presentations/1/edit
  def edit
    @no_sides = true
  end

  def homeless
    list = []
    Presentation.all.each do |p|
      if !p.presentable.skill_id.present?
        list.push(p.id)
      end
    end
    @presentations = Presentation.where(id: list)
  end

  # POST /presentations
  # POST /presentations.json
  def create
    @presentation = Presentation.new(presentation_params)

    respond_to do |format|
      if @presentation.save
        format.html { redirect_to @presentation, notice: 'Presentation was successfully created.' }
        format.json { render json: @presentation, serializer: PresentationSerializer }
      else
        format.html { render :new }
        format.json { render json: @presentation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /presentations/1
  # PATCH/PUT /presentations/1.json
  def update
    respond_to do |format|
      if @presentation.update(presentation_params)
        format.html { redirect_to @presentation, notice: 'Presentation was successfully updated.' }
        format.json { render json: @presentation, serializer: PresentationSerializer }
      else
        format.html { render :edit }
        format.json { render json: @presentation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presentations/1
  # DELETE /presentations/1.json
  def destroy
    @presentation.destroy
    respond_to do |format|
      format.html { redirect_to presentations_url, notice: 'Presentation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presentation
      @presentation = Presentation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def presentation_params
      params.require(:presentation).permit!
    end
end
