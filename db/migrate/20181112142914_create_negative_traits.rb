class CreateNegativeTraits < ActiveRecord::Migration
  def change
    create_table :negative_traits do |t|
      t.string :title
      t.text :details

      t.timestamps null: false
    end
  end
end
