class ConvertStoryDetailsToJsonb < ActiveRecord::Migration[8.0] # or [8.0]
  def change
    add_column :stories, :story_details_json, :jsonb, default: {}, null: false
  end
end