class AddOriginal < ActiveRecord::Migration
  def change
	add_column :songs, :original, :boolean, null: false, default: false
  end
end
