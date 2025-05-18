class CreateProductionUsers < ActiveRecord::Migration
  def change
    create_table :production_users do |t|
      t.integer :production_id
      t.integer :user_id
      t.string :role

      t.timestamps null: false
    end
  end
end
