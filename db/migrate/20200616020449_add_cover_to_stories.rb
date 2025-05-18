class AddCoverToStories < ActiveRecord::Migration
  def change
    add_column :stories, :cover, :string
  end
end
