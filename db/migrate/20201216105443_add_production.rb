class AddProduction < ActiveRecord::Migration
  def change
      add_column :productions, :production_id, :integer
      add_column :productions, :title, :string
      add_column :productions, :code, :string
      add_column :productions, :position, :integer
      add_column :productions, :company, :boolean
      add_column :productions, :user_id, :integer
  end
end
