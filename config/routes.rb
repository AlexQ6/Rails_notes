Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # show all notes
  get "/notes", to: "notes#index", as: "notes"
  

  # form for new note
  get "notes/new", to: "notes#new", as: "new_note"
  post "/notes", to: "notes#create"
  
  
  # show a single note 
  get "notes/:id", to: "notes#show", as: "note"

  delete "notes/:id", to: "notes#delete"

  # edit the single note

  get "/notes/:id/edit", to:"notes#edit", as: "edit_note"

  patch "/notes/:id", to:"notes#update"


  
	# We can use users#new for now, or replace this with the controller and action you want to be the site root:
	root to: 'users#new'
  	
  # sign up page with form:
  get 'users/new' => 'users#new', as: :new_user

  # create (post) action for when sign up form is submitted:
  post 'users' => 'users#create'

    
  # log in page with form:
	get '/login'     => 'sessions#new'
	
	# create (post) action for when log in form is submitted:
	post '/login'    => 'sessions#create'
	
	# delete action to log out:
	delete '/logout' => 'sessions#destroy'  

  

end
