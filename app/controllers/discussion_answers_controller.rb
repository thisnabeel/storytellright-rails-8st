class DiscussionAnswersController < ApplicationController
  before_action :set_discussion_answer, only: [:show, :edit, :update, :destroy]

  # GET /discussion_answers
  # GET /discussion_answers.json
  def index
    @discussion_answers = DiscussionAnswer.all
  end

  # GET /discussion_answers/1
  # GET /discussion_answers/1.json
  def show
  end

  # GET /discussion_answers/new
  def new
    @discussion_answer = DiscussionAnswer.new
  end

  # GET /discussion_answers/1/edit
  def edit
  end

  # POST /discussion_answers
  # POST /discussion_answers.json
  def create
    @discussion_answer = DiscussionAnswer.find_or_create_by(discussion_question_id: params[:discussion_question_id], user_id: params[:user_id])

    respond_to do |format|
      if @discussion_answer.update(discussion_answer_params)
        format.html { redirect_to @discussion_answer, notice: 'Discussion answer was successfully created.' }
        format.json { render :show, status: :created, location: @discussion_answer }
      else
        format.html { render :new }
        format.json { render json: @discussion_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discussion_answers/1
  # PATCH/PUT /discussion_answers/1.json
  def update
    respond_to do |format|
      if @discussion_answer.update(discussion_answer_params)
        format.html { redirect_to @discussion_answer, notice: 'Discussion answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @discussion_answer }
      else
        format.html { render :edit }
        format.json { render json: @discussion_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discussion_answers/1
  # DELETE /discussion_answers/1.json
  def destroy
    @discussion_answer.destroy
    respond_to do |format|
      format.html { redirect_to discussion_answers_url, notice: 'Discussion answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discussion_answer
      @discussion_answer = DiscussionAnswer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discussion_answer_params
      params.require(:discussion_answer).permit(:body, :user_id, :discussion_question_id)
    end
end
