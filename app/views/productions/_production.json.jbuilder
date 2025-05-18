json.merge! production.attributes
json.title production.productionable.present? ? production.productionable.title : production.title
json.tasks production.tasks, partial: "tasks/task", as: :task
json.href production.href
json.icon production.icon
json.stories production.productions.where(productionable_type: "Story").map{|p| p.productionable }
json.songs production.productions.where(productionable_type: "Song")
json.jokes production.productions.where(productionable_type: "Joke")
json.games production.productions.where(productionable_type: "Game")

json.icon production.icon
json.url production_url(production, format: :json)