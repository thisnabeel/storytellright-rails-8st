class CreateStoryFixes < ActiveRecord::Migration[8.0]
  def change
    create_table :story_fixes do |t|
      t.integer :story_id, null: false
      t.text :flawed_belief
      t.text :thesis
      t.text :climax

      t.timestamps null: false
    end

    add_index :story_fixes, :story_id, unique: true
  end
end
