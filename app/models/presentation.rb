class Presentation < ActiveRecord::Base
    belongs_to :presentable, polymorphic: true
    serialize :body

    has_many :slides
    
end
