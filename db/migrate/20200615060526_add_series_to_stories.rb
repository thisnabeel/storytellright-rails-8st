class AddSeriesToStories < ActiveRecord::Migration
  def change
    add_column :stories, :series, :string
  end
end
