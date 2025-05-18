class Slide < ActiveRecord::Base
    belongs_to :presentation

    default_scope { order(position: :asc) }

end
