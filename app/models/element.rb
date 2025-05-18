class Element < ActiveRecord::Base
	belongs_to :elementable, polymorphic: true

	before_destroy :delete_s3_object

	def delete_s3_object

			begin
				s3 = Aws::S3::Resource.new
				# reference an existing bucket by name
				bucket = s3.bucket('storytellright')

				key = self.source.split('storytellright.com/')[1]
		    	bucket.object(key).delete

		    	key = self.preview_url.split('storytellright.com/')[1]
		    	bucket.object(key).delete
	    	rescue
	    	end

	end

end
