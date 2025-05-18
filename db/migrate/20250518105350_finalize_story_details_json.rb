class FinalizeStoryDetailsJson < ActiveRecord::Migration[8.0]
  def change
    remove_column :stories, :story_details, :text
    rename_column :stories, :story_details_json, :story_details
  end
end
