# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_05_18_105350) do
  create_schema "_heroku"
  create_schema "heroku_ext"

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"
  enable_extension "pg_stat_statements"

  create_table "armatures", id: :serial, force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.text "message"
  end

  create_table "articles", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "tags"
    t.string "cover"
    t.integer "user_id"
    t.boolean "visibility"
    t.string "slug"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "chapters", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "post"
    t.string "video"
    t.integer "position"
    t.string "slug"
    t.string "cover"
    t.integer "chapter_id"
    t.boolean "visibility", default: true
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "chord_progressions", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "progression"
    t.string "tags"
    t.string "scale"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "clubs", id: :serial, force: :cascade do |t|
    t.text "members"
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "password"
    t.string "slug"
  end

  create_table "companies", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "folder"
    t.integer "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "code"
  end

  create_table "company_users", id: :serial, force: :cascade do |t|
    t.integer "company_id"
    t.integer "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "discussion_answers", id: :serial, force: :cascade do |t|
    t.text "body"
    t.integer "user_id"
    t.integer "discussion_question_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "discussion_questions", id: :serial, force: :cascade do |t|
    t.text "body"
    t.integer "position"
    t.string "discussion_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "discussions", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "questions"
    t.text "answers"
    t.text "members"
    t.integer "club_id"
    t.datetime "unlock_time", precision: nil
    t.integer "position"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "unlock_at"
    t.string "slug"
  end

  create_table "elements", id: :serial, force: :cascade do |t|
    t.text "body"
    t.string "source"
    t.integer "position"
    t.string "tags"
    t.string "location"
    t.integer "elementable_id"
    t.string "elementable_type"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "emotions", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "details"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "category", default: "green"
  end

  create_table "essays", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.bigint "essay_id"
    t.integer "position"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["essay_id"], name: "index_essays_on_essay_id"
  end

  create_table "games", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "details"
    t.string "maker"
    t.string "link"
    t.integer "year"
    t.boolean "original"
    t.string "cover"
    t.text "tags"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "user_id"
    t.string "series"
    t.integer "production_id"
  end

  create_table "inspirations", id: :serial, force: :cascade do |t|
    t.string "location"
    t.text "body"
    t.string "inspirable_type"
    t.integer "inspirable_id"
    t.text "tags"
    t.integer "position"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "joke_structures", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "joke_triggers", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "jokes", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "flow_details"
    t.text "joke_details"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "user_id"
    t.text "characters"
    t.boolean "original", default: false
    t.integer "year", default: 2019
    t.text "tags", default: ""
    t.string "writer", default: ""
    t.string "link"
    t.integer "production_id"
  end

  create_table "negative_traits", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "details"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "pages", id: :serial, force: :cascade do |t|
    t.string "slug"
    t.text "body"
  end

  create_table "positive_traits", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "details"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "presentations", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.text "post"
    t.integer "presentable_id"
    t.string "presentable_type"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.text "problem"
  end

  create_table "production_users", id: :serial, force: :cascade do |t|
    t.integer "production_id"
    t.integer "user_id"
    t.string "role"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "productions", id: :serial, force: :cascade do |t|
    t.integer "productionable_id"
    t.string "productionable_type"
    t.integer "company_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "production_id"
    t.string "title"
    t.string "code"
    t.integer "position"
    t.boolean "company"
    t.integer "user_id"
  end

  create_table "recipes", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "details"
    t.string "recipe_type"
  end

  create_table "riffs", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "demo"
    t.string "guide"
    t.string "tags"
    t.integer "position"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "slides", force: :cascade do |t|
    t.integer "presentation_id"
    t.text "body"
    t.string "media_url"
    t.integer "body_font_size_desktop"
    t.integer "body_font_size_mobile"
    t.integer "media_size_desktop"
    t.integer "media_size_mobile"
    t.integer "title_font_size_desktop"
    t.integer "title_font_size_mobile"
    t.integer "position"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "songs", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.string "link"
    t.text "notes"
    t.text "folder", default: "--- {}\n"
    t.string "tags"
    t.string "artist"
    t.integer "year"
    t.text "lyrics"
    t.text "message"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "original", default: false, null: false
    t.integer "production_id"
  end

  create_table "stories", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "flow_details"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "user_id"
    t.text "characters"
    t.boolean "original", default: false, null: false
    t.integer "year", default: 2019
    t.text "tags", default: ""
    t.string "writer", default: ""
    t.string "link"
    t.string "series"
    t.string "cover"
    t.string "bookmark", default: "scaffold"
    t.text "fable"
    t.text "pitch"
    t.integer "production_id"
    t.jsonb "story_details", default: {}, null: false
    t.index ["user_id"], name: "index_stories_on_user_id"
  end

  create_table "story_maps", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "story_recipes", id: :serial, force: :cascade do |t|
    t.integer "story_id"
    t.integer "recipe_id"
    t.text "details"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["recipe_id"], name: "index_story_recipes_on_recipe_id"
    t.index ["story_id"], name: "index_story_recipes_on_story_id"
  end

  create_table "symbolisms", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "details"
  end

  create_table "tasks", id: :serial, force: :cascade do |t|
    t.integer "production_id"
    t.integer "user_id"
    t.integer "assigned_id"
    t.text "note"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "name"
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.json "tokens"
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visuals", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "details"
    t.string "maker"
    t.string "link"
    t.integer "year"
    t.boolean "original"
    t.text "tags"
    t.integer "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "production_id"
  end

  add_foreign_key "essays", "essays"
end
