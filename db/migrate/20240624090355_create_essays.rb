class CreateEssays < ActiveRecord::Migration[5.2]
  def change
    create_table :essays do |t|
      t.string :title
      t.text :body
      t.belongs_to :essay, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
