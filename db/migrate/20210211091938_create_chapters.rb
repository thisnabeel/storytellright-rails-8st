class CreateChapters < ActiveRecord::Migration
  def change
    create_table "chapters", force: :cascade do |t|
      t.string  "title"
      t.text    "description"
      t.text    "post"
      t.string  "video"
      t.integer "position"
      t.string  "slug"
      t.string  "cover"
      t.integer "chapter_id"
      t.boolean "visibility", default: true
      t.timestamps
    end
  end
end