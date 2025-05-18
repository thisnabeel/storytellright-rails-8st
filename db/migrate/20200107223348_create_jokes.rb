class CreateJokes < ActiveRecord::Migration
  def change
	  create_table "jokes", force: :cascade do |t|
	    t.string   "title"
	    t.text     "flow_details"
	    t.text     "joke_details"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	    t.integer  "user_id"
	    t.text     "characters"
	    t.boolean  "original",      default: false
	    t.integer  "year",          default: 2019
	    t.text     "tags",          default: ""
	    t.string   "writer",        default: ""
	    t.string   "link"
	  end
  end
end
