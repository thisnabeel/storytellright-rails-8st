class CreateJokeStructures < ActiveRecord::Migration
  def change
    create_table :joke_structures do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
