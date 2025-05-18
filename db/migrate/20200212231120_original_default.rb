class OriginalDefault < ActiveRecord::Migration
  def change
	change_column :stories, :original, :boolean, null: false, default: false
  end
end
