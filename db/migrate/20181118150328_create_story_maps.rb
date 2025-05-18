class CreateStoryMaps < ActiveRecord::Migration
  def change
    create_table :story_maps do |t|
      t.string :title
      t.string :body

      t.timestamps null: false
    end
  end
end
