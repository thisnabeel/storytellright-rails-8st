class CreateVisuals < ActiveRecord::Migration
  def change
    create_table :visuals do |t|
      t.string :title
      t.text :details
      t.string :maker
      t.string :link
      t.integer :year
      t.boolean :original
      t.text :tags
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
