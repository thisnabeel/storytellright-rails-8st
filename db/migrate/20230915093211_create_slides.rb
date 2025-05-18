class CreateSlides < ActiveRecord::Migration[5.2]
  def change
    create_table :slides do |t|
      t.integer :presentation_id
      t.text :body
      t.string :media_url
      t.integer :body_font_size_desktop
      t.integer :body_font_size_mobile
      t.integer :media_size_desktop
      t.integer :media_size_mobile
      t.integer :title_font_size_desktop
      t.integer :title_font_size_mobile
      t.integer :position

      t.timestamps
    end
  end
end
