class JokeTriggersController < ApplicationController
  before_action :set_joke_trigger, only: [:show, :edit, :update, :destroy]

  # GET /joke_triggers
  # GET /joke_triggers.json
  def index
    @joke_triggers = JokeTrigger.all
  end

  # GET /joke_triggers/1
  # GET /joke_triggers/1.json
  def show
  end

  # GET /joke_triggers/new
  def new
    @joke_trigger = JokeTrigger.new
  end

  # GET /joke_triggers/1/edit
  def edit
  end

  # POST /joke_triggers
  # POST /joke_triggers.json
  def create
    @joke_trigger = JokeTrigger.new(joke_trigger_params)

    respond_to do |format|
      if @joke_trigger.save
        format.html { redirect_to @joke_trigger, notice: 'Joke trigger was successfully created.' }
        format.json { render :show, status: :created, location: @joke_trigger }
      else
        format.html { render :new }
        format.json { render json: @joke_trigger.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /joke_triggers/1
  # PATCH/PUT /joke_triggers/1.json
  def update
    respond_to do |format|
      if @joke_trigger.update(joke_trigger_params)
        format.html { redirect_to @joke_trigger, notice: 'Joke trigger was successfully updated.' }
        format.json { render :show, status: :ok, location: @joke_trigger }
      else
        format.html { render :edit }
        format.json { render json: @joke_trigger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /joke_triggers/1
  # DELETE /joke_triggers/1.json
  def destroy
    @joke_trigger.destroy
    respond_to do |format|
      format.html { redirect_to joke_triggers_url, notice: 'Joke trigger was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_joke_trigger
      @joke_trigger = JokeTrigger.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def joke_trigger_params
      params.require(:joke_trigger).permit(:title, :description)
    end
end
