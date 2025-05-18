class CreateSymbolisms < ActiveRecord::Migration
  def change
    create_table :symbolisms do |t|
      t.string :title
      t.text :details
    end
  end
end
