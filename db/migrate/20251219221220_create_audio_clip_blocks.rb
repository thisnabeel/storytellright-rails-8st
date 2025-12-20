class CreateAudioClipBlocks < ActiveRecord::Migration[8.0]
  def change
    create_table :audio_clip_blocks do |t|
      t.integer :audio_clip_id
      t.string :title
      t.decimal :time, precision: 10, scale: 2
      t.decimal :end_time, precision: 10, scale: 2
      t.integer :position

      t.timestamps null: false
    end

    add_index :audio_clip_blocks, :audio_clip_id
  end
end

