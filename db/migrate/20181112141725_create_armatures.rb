class CreateArmatures < ActiveRecord::Migration
  def change
    create_table :armatures do |t|
      t.string :title

      t.timestamps
    end
  end
end
