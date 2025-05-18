class ChangeTimeColumn < ActiveRecord::Migration
  def change
	  add_column :discussions, :unlock_at, :string
  end
end
