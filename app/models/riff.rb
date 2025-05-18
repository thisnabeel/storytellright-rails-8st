class Riff < ActiveRecord::Base

	before_destroy :delete_s3_object

	def delete_s3_object

		s3 = Aws::S3::Resource.new
		# reference an existing bucket by name
		bucket = s3.bucket('storytellright')

		if self.demo.present? && self.demo.length > 1
			key = self.demo.split('amazonaws.com/')[1]
    		bucket.object(key).delete
		end

		if self.guide.present? && self.guide.length > 1
			key = self.guide.split('amazonaws.com/')[1]
    		bucket.object(key).delete
		end

	end
end
