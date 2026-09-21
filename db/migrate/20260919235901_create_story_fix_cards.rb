class CreateStoryFixCards < ActiveRecord::Migration[8.0]
  def change
    create_table :story_fix_cards do |t|
      t.integer :story_fix_id, null: false
      t.string :title
      t.string :bucket, default: 'elements', null: false
      t.integer :position, default: 0, null: false

      t.timestamps null: false
    end

    add_index :story_fix_cards, :story_fix_id
    add_index :story_fix_cards, [:story_fix_id, :bucket, :position]
  end
end
