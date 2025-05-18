class SetSongFolderDefault < ActiveRecord::Migration
  def change
  	change_column :songs, :folder, :text, :default => {}
  end
end
