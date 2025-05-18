json.extract! joke, :id, :title, :writer, :year, :joke_details, :created_at, :updated_at, :link
json.url joke_url(joke, format: :json)
st