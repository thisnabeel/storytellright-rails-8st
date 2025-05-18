class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer :user_id
      t.string :title
      t.string :link
      t.text :notes
      t.text :folder
      t.string :tags
      t.string :artist
      t.integer :year
      t.text :lyrics
      t.text :message

      t.timestamps null: false
    end
  end
end
