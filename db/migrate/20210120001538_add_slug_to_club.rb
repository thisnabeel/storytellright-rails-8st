class AddSlugToClub < ActiveRecord::Migration
  def change
    add_column :clubs, :slug, :string
	  add_column :discussions, :slug, :string
  end
end
