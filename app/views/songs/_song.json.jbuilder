json.extract! song, :id, :artist, :message, :lyrics, :title, :link, :notes, :folder, :tags, :created_at, :updated_at
json.url song_url(song, format: :json)
