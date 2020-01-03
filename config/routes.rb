Rails.application.routes.draw do
  
  
 
  
  resources :genres
  resource :sessions,only: [:new,:create,:destroy]
  resources :users
  get 'create_admin/:id' => 'users#create_admin', as: :create_admin
  get 'remove_admin/:id' => 'users#remove_admin', as: :remove_admin
  root 'movies#index'
  get 'books#index'=> 'books#index', as: :root1
  delete '/movies/:movie_id/favorites/:id' => 'favorites#destroy', as: :movie_favorite
  resources :books
  resources :movies  do
     resources :reviews
     resources :favorites
   end
  # get 'movies'=>'movies#index', as: :index
  # get 'movies/new'=>"movies#new"
  # get 'movies/:id'=>'movies#show', as: :movie
  # get 'movies/:id/edit'=>'movies#edit', as: "edit_movie"
  # patch 'movies/:id'=>'movies#update'	

end
