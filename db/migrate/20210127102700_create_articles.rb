class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.string :tags
      t.string :cover
      t.integer :user_id
      t.boolean :visibility
      t.string :slug

      t.timestamps
    end
  end
end
