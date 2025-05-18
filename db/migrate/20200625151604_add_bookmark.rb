class AddBookmark < ActiveRecord::Migration
  def change
  	add_column :stories, :bookmark, :string, default: "scaffold"
  end
end
