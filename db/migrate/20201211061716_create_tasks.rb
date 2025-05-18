class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :production_id
      t.integer :user_id
      t.integer :assigned_id
      t.text :note

      t.timestamps null: false
    end
  end
end
