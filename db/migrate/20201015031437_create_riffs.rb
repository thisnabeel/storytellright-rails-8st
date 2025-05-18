class CreateRiffs < ActiveRecord::Migration
  def change
    create_table :riffs do |t|
      t.string :title
      t.string :demo
      t.string :guide
      t.string :tags
      t.integer :position

      t.timestamps null: false
    end
  end
end
