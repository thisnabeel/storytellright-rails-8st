class AddCharactersToStory < ActiveRecord::Migration
  def change
    add_column :stories, :characters, :text
  end
end
