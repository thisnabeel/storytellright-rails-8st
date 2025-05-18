class CreateDiscussionQuestions < ActiveRecord::Migration
  def change
    create_table :discussion_questions do |t|
      t.text :body
      t.integer :position
      t.string :discussion_id

      t.timestamps null: false
    end
  end
end
