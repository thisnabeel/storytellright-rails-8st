json.extract! game, :id, :title, :details, :maker, :link, :year, :original, :cover, :tags, :created_at, :updated_at
json.url game_url(game, format: :json)
