class ChangeDefaultOriginalityJokes < ActiveRecord::Migration
  def change
	change_column :songs, :original, :boolean, null: false, default: false
  end
end
