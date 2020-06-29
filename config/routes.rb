Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # show all notes
  get "/notes", to: "notes#index", as: "notes"
  post "/notes", to: "notes#create"


  # form for new note
  get "notes/new", to: "notes#new", as: "new_note"
  
  # show a single note 
  get "notes/:id", to: "notes#show", as: "note"

  # edit the single note

  get "/notes/:id/edit", to:"notes#edit", as: "edit_note"

  patch "/notes/:id", to:"notes#update"




  

end
