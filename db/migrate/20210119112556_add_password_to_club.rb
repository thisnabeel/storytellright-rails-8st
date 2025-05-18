class AddPasswordToClub < ActiveRecord::Migration
  def change
	  add_column :clubs, :password, :string
  end
end
