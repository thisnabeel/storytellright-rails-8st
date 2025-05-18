class CreateDiscussionAnswers < ActiveRecord::Migration
  def change
    create_table :discussion_answers do |t|
      t.text :body
      t.integer :user_id
      t.integer :discussion_question_id

      t.timestamps null: false
    end
  end
end
