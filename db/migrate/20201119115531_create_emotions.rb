class CreateEmotions < ActiveRecord::Migration
  def change
    create_table :emotions do |t|
      t.string :title
      t.text :details

      t.timestamps null: false
    end
  end
end
