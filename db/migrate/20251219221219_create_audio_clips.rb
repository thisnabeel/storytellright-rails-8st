class CreateAudioClips < ActiveRecord::Migration[8.0]
  def change
    create_table :audio_clips do |t|
      t.string :title
      t.string :audio_url
      t.string :filename

      t.timestamps null: false
    end
  end
end

