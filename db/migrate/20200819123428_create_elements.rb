class CreateElements < ActiveRecord::Migration
  def change
    create_table :elements do |t|
      t.text :body
      t.string :source
      t.integer :position
      t.string :tags
      t.string :location
      t.integer :elementable_id
      t.string :elementable_type

      t.timestamps null: false
    end
  end
end
