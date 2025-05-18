class CreateInspirations < ActiveRecord::Migration
  def change
    create_table :inspirations do |t|
      t.string :location
      t.text :body
      t.string :inspirable_type
      t.integer :inspirable_id
      t.text :tags
      t.integer :position

      t.timestamps null: false
    end
  end
end
