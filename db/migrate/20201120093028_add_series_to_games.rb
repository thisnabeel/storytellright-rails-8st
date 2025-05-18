class AddSeriesToGames < ActiveRecord::Migration
  def change
    add_column :games, :series, :string
  end
end
