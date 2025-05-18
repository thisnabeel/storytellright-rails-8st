class Inspiration < ActiveRecord::Base
	belongs_to :inspirable, polymorphic: true
end
