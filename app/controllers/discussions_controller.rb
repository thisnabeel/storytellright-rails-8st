class DiscussionsController < ApplicationController
  before_action :set_discussion, only: [:show, :edit, :update, :destroy]

  # GET /discussions
  # GET /discussions.json
  def index
    @discussions = Discussion.all
  end

  # GET /discussions/1
  # GET /discussions/1.json
  def show
  end

  def discussion
    @discussion = Discussion.find(params[:id])
    render json: { html: render_to_string(
      partial: 'discussions/card', 
      locals: { 
        discussion: @discussion
      }) 
    }
  end

  # GET /discussions/new
  def new
    @discussion = Discussion.new
  end

  # GET /discussions/1/edit
  def edit
  end

  # POST /discussions
  # POST /discussions.json
  def create
    @discussion = Discussion.new(discussion_params)

    respond_to do |format|
      if @discussion.save
        html = render_to_string(
            partial: 'discussions/card', 
            locals: { 
            discussion: @discussion
          }) 
        format.html { redirect_to @discussion, notice: 'Discussion was successfully created.' }
        format.json { 
          render json: {html: html}
        }
      else
        format.html { render :new }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  def duplicate
    discussion = Discussion.find(params[:id])
    @new = Discussion.create(title: "Untitled", club_id: discussion.club_id, position: (discussion.club.discussions.order("position ASC").last.position + 1))
    discussion.questions.each do |dq|
      dn = DiscussionQuestion.new(dq.dup.attributes)
      dn.discussion_id = @new.id
      dn.save
    end

    render json: { html: render_to_string(
      partial: 'discussions/card', 
      locals: { 
        discussion: @new
      }) 
    }
  end

  # PATCH/PUT /discussions/1
  # PATCH/PUT /discussions/1.json
  def update
    respond_to do |format|
      if @discussion.update(discussion_params)
        format.html { redirect_to @discussion, notice: 'Discussion was successfully updated.' }
        format.json { render :show, status: :ok, location: @discussion }
      else
        format.html { render :edit }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discussions/1
  # DELETE /discussions/1.json
  def destroy
    @discussion.destroy
    respond_to do |format|
      format.html { redirect_to discussions_url, notice: 'Discussion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discussion
      @discussion = Discussion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discussion_params
      params.require(:discussion).permit!
    end
end
