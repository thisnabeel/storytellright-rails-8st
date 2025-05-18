class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
    	t.string :slug
    	t.text :body
    end
  end
end
