class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
		t.string :title
		t.text :flow_details
		t.text :story_details
		t.timestamps
		t.belongs_to :user, index: true 
    end

    create_table :recipes do |t|
		t.string :title
		t.text :description
		t.text :details
    end

    create_table :story_recipes do |t|
		t.belongs_to :story, index: true 
		t.belongs_to :recipe, index: true 
		t.text :details
		t.timestamps
    end
  end
end
