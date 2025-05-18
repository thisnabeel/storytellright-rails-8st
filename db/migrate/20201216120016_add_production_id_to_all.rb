class AddProductionIdToAll < ActiveRecord::Migration
  def change
      add_column :stories, :production_id, :integer
      add_column :songs, :production_id, :integer
      add_column :visuals, :production_id, :integer
      add_column :jokes, :production_id, :integer
      add_column :games, :production_id, :integer
  end
end
