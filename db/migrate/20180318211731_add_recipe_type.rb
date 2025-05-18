class AddRecipeType < ActiveRecord::Migration
  def change
    add_column :recipes, :recipe_type, :string
  end
end
