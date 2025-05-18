class CreateJokeTriggers < ActiveRecord::Migration
  def change
    create_table :joke_triggers do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
