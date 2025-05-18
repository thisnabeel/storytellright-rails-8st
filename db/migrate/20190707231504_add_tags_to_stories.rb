class AddTagsToStories < ActiveRecord::Migration
  def change
    add_column :stories, :tags, :text, default: ""
    add_column :stories, :writer, :string, default: ""
  end
end
