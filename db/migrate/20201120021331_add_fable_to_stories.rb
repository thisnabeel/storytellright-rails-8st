class AddFableToStories < ActiveRecord::Migration
  def change
	add_column :stories, :fable, :text
  end
end
