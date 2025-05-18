class AddYearToStories < ActiveRecord::Migration
  def change
    add_column :stories, :year, :integer, default: 2019
  end
end
