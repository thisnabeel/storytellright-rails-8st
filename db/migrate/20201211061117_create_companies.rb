class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :title
      t.text :folder
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
