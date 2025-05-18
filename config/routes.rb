Rails.application.routes.draw do
  resources :essays
  resources :slides
  resources :discussions
  resources :discussion_questions
  resources :discussion_answers
  resources :clubs
  resources :production_users
  resources :company_users
  resources :tasks
  resources :productions
  resources :companies
  resources :visuals
  resources :games
  resources :emotions
  resources :riffs
  resources :chord_progressions
  resources :elements
  resources :inspirations
  resources :songs
  resources :joke_structures
  resources :joke_triggers
  resources :story_maps
  resources :negative_traits
  resources :positive_traits
  resources :armatures
  resources :jokes
  resources :articles
  resources :chapters
  resources :presentations

  resources :wizard do
    collection do
      post :ask
    end
  end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  devise_for :users, controllers: {
    sessions: 'users/sessions',
  }

  post "/make_user" => "users#make_user"

  post "/config_chapters" => "chapters#config_chapters"
  get '/cached_chapters' => "chapters#cached"
  
  # PRESENTATIONS
  get '/presentations/:type/:id' => "presentations#by_item"

  get '/watch' => 'stories#watch_list'
  get '/play' => 'games#play'
  get "/listen" => "songs#listen"
  get "/marvel" => "visuals#marvel"
  get "/laugh" => "jokes#laugh"

  get '/discussion/:id' => 'discussions#discussion'
  
  post '/discussions/duplicate' => 'discussions#duplicate'

  post '/add_answer' => 'discussions#add_answer'


  get '/stories' => 'stories#index'
  get '/original/stories' => 'stories#originals'
  get '/original/songs' => 'songs#originals'
  get '/original/games' => 'games#originals'
  get '/original/jokes' => 'jokes#originals'
  get '/original/visuals' => 'visuals#originals'


  get '/stories/:id/read' => 'stories#read'


  get "/music/lab" => "songs#lab"

  get "/classics/:code" => 'classics#list'

  get "/traits/test" => "negative_traits#test"

  get "/get_hells" => "stories#get_hells"

  post "/config_productions" => "productions#config_productions"
  post "/production/users/config" => "production_users#user_config"
  post "/company/users/config" => "company_users#user_config"

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

  resources :stories
  resources :recipes
  resources :story_recipes
  resources :symbolisms


  get "/inspirations/for/:type" => "inspirations#index"
  post "/find_inspirations" => "inspirations#find_inspirations"
  post "/search_inspirations" => "inspirations#search"

  post "/stories/search" => 'stories#search'
  get "/stories/:id/essay" => 'stories#essay'

  get "/test" => 'pages#test'
  get "/acts" => 'pages#acts'
  get "/about" => 'pages#about'

  get "/punchlines" => 'stories#punchlines'
  get "/climaxes" => 'stories#punchlines'

  get "/screenwriter" => 'pages#screenwriter'

  get "/i-hate" => 'stories#hate_list'
  get "/circle" => 'pages#circle'
  get "/st/:story_id/:recipe_id" => 'story_recipes#init_recipe'

  # get '/jokes' => 'pages#jokes'

  # Drills
  get '/comedy_drills/:drill' => 'comedy_drills#find'

  post '/create_story' => 'stories#create_story'
  post '/delete_story' => 'stories#delete_story'
  post '/edit_characters' => 'stories#edit_characters'
  post '/delete_character' => 'stories#delete_character'

  post '/create_joke' => 'jokes#create_joke'
  post '/delete_joke' => 'jokes#delete_joke'

  post '/create_song' => 'songs#create'

  post '/page-edit' => 'pages#page_edit'
  # get '/landing' => 'pages#landing'
  
  post '/chat_gpt/purpose_ai' => "stories#purpose_ai"
  post '/chat_gpt/lead_ai' => "stories#lead_ai"
  post '/chat_gpt/climax_ai' => "stories#climax_ai"
  post '/chat_gpt/harm_ai' => "stories#harm_ai"

  get '/fetcher/:search' => 'fetcher#fetch_quotes'

  get '/stats' => 'stories#stats'

  get '/essays' => 'pages#essays'
  get '/essays/:editor' => 'pages#essays'
  get '/presentation/:id' => 'pages#presentation'

  get "/home" => "pages#landing"

  get '/:code/map' => "productions#index", :constraints => { :code => /[^\/]+/ }
  get '/:code' => "productions#show", :constraints => { :code => /[^\/]+/ }


  root 'pages#home'
end
