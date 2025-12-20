class AudioClip < ActiveRecord::Base
	has_many :audio_clip_blocks, dependent: :destroy

	before_destroy :delete_s3_object

	def delete_s3_object
		return unless self.audio_url.present? && self.audio_url.length > 1

		begin
			s3 = Aws::S3::Resource.new
			bucket = s3.bucket('storytellright')

			# Extract key from URL (handles both amazonaws.com and storytellright.com formats)
			if self.audio_url.include?('amazonaws.com/')
				key = self.audio_url.split('amazonaws.com/')[1]
			elsif self.audio_url.include?('storytellright.com/')
				key = self.audio_url.split('storytellright.com/')[1]
			else
				# If it's just a key path
				key = self.audio_url.gsub(/^https?:\/\//, '').split('/', 2)[1]
			end

			bucket.object(key).delete if key.present?
		rescue => e
			Rails.logger.error "Failed to delete S3 object: #{e.message}"
		end
	end
end

