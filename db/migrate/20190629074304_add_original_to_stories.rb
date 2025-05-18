class AddOriginalToStories < ActiveRecord::Migration
  def change
    add_column :stories, :original, :boolean, default: false
  end
end
