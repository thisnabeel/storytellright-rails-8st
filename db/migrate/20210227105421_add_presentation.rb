class AddPresentation < ActiveRecord::Migration
  def change
    create_table "presentations", force: :cascade do |t|
      t.string   "title"
      t.text     "body"
      t.text     "post"
      t.integer  "presentable_id"
      t.string   "presentable_type"
      t.datetime "created_at",       null: false
      t.datetime "updated_at",       null: false
      t.text     "problem"
    end
  end
end
