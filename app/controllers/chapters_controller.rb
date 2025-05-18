class ChaptersController < ApplicationController
  before_action :set_chapter, only: [:show, :edit, :update, :destroy]


  # GET /chapters
  # GET /chapters.json
  def index
      # @chapters = Chapter.all.order("position ASC")
      @chapters = Chapter.all_cached
  end

  def books
    @books = Chapter.where(chapter_id: nil).order("position ASC")
  end


  def cached
    @chapters = Chapter.all_cached
    render json: @chapters
  end

  # GET /chapters/1
  # GET /chapters/1.json
  def show
  end

  # GET /chapters/new
  def new
    @chapter = Chapter.new
  end

  # GET /chapters/1/edit
  def edit
  end

  # POST /chapters
  # POST /chapters.json
  def create
    @chapter = Chapter.new(chapter_params)

    respond_to do |format|
      if @chapter.save
        format.html { redirect_to @chapter, notice: 'Chapter was successfully created.' }
        format.json { render :show, status: :created, location: @chapter }
      else
        format.html { render :new }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chapters/1
  # PATCH/PUT /chapters/1.json
  def update
    respond_to do |format|
      if @chapter.update(chapter_params)
        format.html { redirect_to @chapter, notice: 'Chapter was successfully updated.' }
        format.json { render :show, status: :ok, location: @chapter }
      else
        format.html { render :edit }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.json
  def destroy
    @chapter.destroy
    respond_to do |format|
      format.html { redirect_to "/books/" + @chapter.book.id.to_s, notice: 'Chapter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # 

  def config_chapters
    # Get List Array
    list = params[:list]

    puts list

    # Each Chapter
    list.each do |t|
    # Find Chapter
    chapter = Chapter.find(t["id"])
    # chapter.update(chapter_id: nil)
    chapter.update(
      position: t["position"],
      chapter_id: t["belongs"],
    ) 
    end

    render status: 200, json: {
      message: "Successfully saved map!",
    }.to_json
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chapter
      @chapter = Chapter.find_by(slug: params[:id]) || Chapter.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chapter_params
      params.require(:chapter).permit!
    end
end
