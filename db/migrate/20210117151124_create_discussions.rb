class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.string :title
      t.text :description
      t.text :questions
      t.text :answers
      t.text :members
      t.integer :club_id
      t.datetime :unlock_time
      t.integer :position

      t.timestamps null: false
    end
  end
end
