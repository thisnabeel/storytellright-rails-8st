class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.text :details
      t.string :maker
      t.string :link
      t.integer :year
      t.boolean :original
      t.string :cover
      t.text :tags

      t.timestamps null: false
    end
  end
end
