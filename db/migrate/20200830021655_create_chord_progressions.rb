class CreateChordProgressions < ActiveRecord::Migration
  def change
    create_table :chord_progressions do |t|
      t.string :title
      t.string :progression
      t.string :tags
      t.string :scale

      t.timestamps null: false
    end
  end
end
