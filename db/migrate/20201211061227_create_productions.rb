class CreateProductions < ActiveRecord::Migration
  def change
    create_table :productions do |t|
      t.integer :productionable_id
      t.string :productionable_type
      t.integer :company_id

      t.timestamps null: false
    end
  end
end
