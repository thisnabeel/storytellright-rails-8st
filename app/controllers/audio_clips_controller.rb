class AudioClipsController < ApplicationController
  before_action :set_audio_clip, only: [:show, :update, :destroy]

  # GET /audio_clips
  # GET /audio_clips.json
  def index
    @audio_clips = AudioClip.all.order(created_at: :desc)
    
    respond_to do |format|
      format.html
      format.json { render json: @audio_clips.to_json(include: :audio_clip_blocks) }
    end
  end

  # GET /audio_clips/1
  # GET /audio_clips/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render json: @audio_clip.to_json(include: :audio_clip_blocks) }
    end
  end

  # POST /audio_clips/upload
  # Upload audio file to S3 and return URL
  def upload
    file = params[:file]
    
    if file.nil? || !file.respond_to?(:tempfile)
      render json: { error: 'No file provided' }, status: :unprocessable_entity
      return
    end

    begin
      # Check if AWS credentials are configured
      if ENV['AWS_ACCESS_KEY_ID'].blank? || ENV['AWS_SECRET_ACCESS_KEY'].blank?
        Rails.logger.error "AWS credentials not configured"
        render json: { error: 'AWS credentials not configured. Please set AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY environment variables.' }, status: :internal_server_error
        return
      end

      # Get original filename and clean it up
      original_filename = file.original_filename || 'audio_file'
      # Remove .undefined extension if present
      original_filename = original_filename.gsub(/\.undefined$/, '')
      
      # Extract file extension
      file_extension = File.extname(original_filename)
      
      # If no extension or extension is invalid, try to detect from content type
      if file_extension.blank? || file_extension == '.undefined' || file_extension.length > 5
        if file.content_type.present?
          case file.content_type
          when 'audio/mpeg', 'audio/mp3'
            file_extension = '.mp3'
          when 'audio/wav', 'audio/x-wav'
            file_extension = '.wav'
          when 'audio/ogg', 'audio/oga'
            file_extension = '.ogg'
          when 'audio/m4a', 'audio/x-m4a'
            file_extension = '.m4a'
          when 'audio/webm'
            file_extension = '.webm'
          else
            file_extension = '.mp3' # default
          end
        else
          file_extension = '.mp3' # final fallback
        end
      end

      # Generate unique filename
      timestamp = Time.now.to_i
      key = "audio_clips/#{timestamp}#{file_extension}"

      # Upload to S3
      obj = S3_BUCKET.object(key)
      obj.upload_file(file.tempfile.path, acl: 'public-read')

      # Get the public URL
      audio_url = obj.public_url

      render json: { audio_url: audio_url, filename: original_filename }, status: :ok
    rescue Aws::Errors::ServiceError => e
      Rails.logger.error "S3 upload error: #{e.class.name} - #{e.message}"
      Rails.logger.error e.backtrace.join("\n")
      
      error_message = if e.message.include?('Access Key Id') || e.message.include?('InvalidAccessKeyId')
        "AWS credentials are invalid or not configured. Please check your AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY environment variables."
      elsif e.message.include?('SignatureDoesNotMatch')
        "AWS secret key is incorrect. Please check your AWS_SECRET_ACCESS_KEY."
      else
        "S3 upload failed: #{e.message}"
      end
      
      render json: { error: error_message }, status: :internal_server_error
    rescue => e
      Rails.logger.error "Upload error: #{e.message}"
      Rails.logger.error e.backtrace.join("\n")
      render json: { error: "Failed to upload file: #{e.message}" }, status: :internal_server_error
    end
  end

  # POST /audio_clips
  # POST /audio_clips.json
  def create
    @audio_clip = AudioClip.new(audio_clip_params)

    respond_to do |format|
      if @audio_clip.save
        format.html { redirect_to @audio_clip, notice: 'Audio clip was successfully created.' }
        format.json { render json: @audio_clip.to_json(include: :audio_clip_blocks), status: :created }
      else
        format.html { render :new }
        format.json { render json: @audio_clip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /audio_clips/1
  # PATCH/PUT /audio_clips/1.json
  def update
    respond_to do |format|
      if @audio_clip.update(audio_clip_params)
        format.html { redirect_to @audio_clip, notice: 'Audio clip was successfully updated.' }
        format.json { render json: @audio_clip.to_json(include: :audio_clip_blocks), status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @audio_clip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /audio_clips/1
  # DELETE /audio_clips/1.json
  def destroy
    @audio_clip.destroy
    respond_to do |format|
      format.html { redirect_to audio_clips_url, notice: 'Audio clip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # POST /audio_clips/:id/update_blocks
  # Create or update blocks for an audio clip
  def update_blocks
    @audio_clip = AudioClip.find(params[:id])
    
    # Delete existing blocks
    @audio_clip.audio_clip_blocks.destroy_all
    
    # Create new blocks from params
    if params[:blocks].present?
      params[:blocks].each_with_index do |block_params, index|
        @audio_clip.audio_clip_blocks.create(
          title: block_params[:title] || '',
          time: block_params[:time],
          end_time: block_params[:end_time],
          position: index
        )
      end
    end
    
    # Reload to get fresh associations
    @audio_clip.reload
    
    respond_to do |format|
      format.json { render json: @audio_clip.to_json(include: :audio_clip_blocks), status: :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_audio_clip
      @audio_clip = AudioClip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def audio_clip_params
      params.require(:audio_clip).permit(:title, :audio_url, :filename)
    end
end

