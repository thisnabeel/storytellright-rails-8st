class DiscussionQuestionsController < ApplicationController
  before_action :set_discussion_question, only: [:show, :edit, :update, :destroy]

  # GET /discussion_questions
  # GET /discussion_questions.json
  def index
    @discussion_questions = DiscussionQuestion.all
  end

  # GET /discussion_questions/1
  # GET /discussion_questions/1.json
  def show
  end

  def question
    @question = DiscussionQuestion.find(params[:id])
    render json: { html: render_to_string(
      partial: 'discussions/question', 
      locals: { 
        question: @question
      }) 
    }
  end

  # GET /discussion_questions/new
  def new
    @discussion_question = DiscussionQuestion.new
  end

  # GET /discussion_questions/1/edit
  def edit
  end

  # POST /discussion_questions
  # POST /discussion_questions.json
  def create
    @discussion_question = DiscussionQuestion.new(discussion_question_params)

    respond_to do |format|
      if @discussion_question.save
        html = render_to_string(
            partial: 'discussions/question', 
            locals: { 
            question: @discussion_question,
            discussion: @discussion_question.discussion
          }
        ) 
        format.html { redirect_to @discussion_question, notice: 'Discussion question was successfully created.' }
        format.json { render json: {html: html} }
      else
        format.html { render :new }
        format.json { render json: @discussion_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discussion_questions/1
  # PATCH/PUT /discussion_questions/1.json
  def update
    respond_to do |format|
      if @discussion_question.update(discussion_question_params)
        format.html { redirect_to @discussion_question, notice: 'Discussion question was successfully updated.' }
        format.json { render :show, status: :ok, location: @discussion_question }
      else
        format.html { render :edit }
        format.json { render json: @discussion_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discussion_questions/1
  # DELETE /discussion_questions/1.json
  def destroy
    @discussion_question.destroy
    respond_to do |format|
      format.html { redirect_to discussion_questions_url, notice: 'Discussion question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discussion_question
      @discussion_question = DiscussionQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discussion_question_params
      params.require(:discussion_question).permit(:body, :position, :discussion_id)
    end
end
