class AddMessageToArmature < ActiveRecord::Migration
  def change
    add_column :armatures, :message, :text
  end
end
