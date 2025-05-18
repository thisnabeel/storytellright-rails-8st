class AddPitchToStory < ActiveRecord::Migration
  def change
	add_column :stories, :pitch, :text
  end
end
