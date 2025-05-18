class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.text :members
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
