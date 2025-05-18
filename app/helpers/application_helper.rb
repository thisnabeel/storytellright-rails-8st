module ApplicationHelper

  	def url_has(array)
	    array.each do |a|
	    	if request.path.start_with?(a)
	    		return true
	    	end
	    end
	    return false
	end

	def getAmazonSignature
		return AmazonSignature::data_hash
	end

	def admin?
		if User.is_admin? current_user
			return true
		else
			return false
		end
	end

end
	