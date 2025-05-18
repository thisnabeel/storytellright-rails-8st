class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  # GET /songs
  # GET /songs.json
  def index
    authenticate_user!
    @original = false

    if !User.is_admin? current_user
      redirect_to "/listen"
    else 
      @songs = Song.all.order("year DESC").where(original: false)
    end
  end

  def originals
    authenticate_user!
    @original = true
    @songs = Song.where(original: true, user_id: current_user.id).order("year DESC")
  end

  def lab
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
  end

  # 
  def listen
    @songs = Song.ready
  end

  # POST /songs
  # POST /songs.json
  def create

    if params["prod_id"].present?
			@song = Production.link(Song, song_params, params["prod_id"])
		else
			@song = Song.create(song_params)
		end
		render json: @song.attributes.merge({
			production: @song.production
    })
    
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        
        pusher = Pusher::Client.new(
          app_id: '1113609',
          key: 'e6efc10ac1252fe7b8ab',
          secret: '25b5e41960b683421b39',
          cluster: 'us3',
          encrypted: true
        )

        pusher.trigger("song-#{@song.id}", 'update-song', {
          song: @song,
          writer_id: current_user.id
        })

        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url, notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit!
    end
end
