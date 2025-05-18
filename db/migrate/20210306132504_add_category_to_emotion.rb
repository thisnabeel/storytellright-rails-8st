class AddCategoryToEmotion < ActiveRecord::Migration
  def change
    add_column :emotions, :category, :string, default: "green"
  end
end