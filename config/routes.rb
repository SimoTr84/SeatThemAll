Rails.application.routes.draw do
  resources :floorplans
  resources :restaurants, :operators

  get "/restaurants/:id/floorplans" => "floorplans#new"
  post "/restaurants/:id/floorplans/add" => "floorplans#add"

  root to: 'pages#home'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/logout' => 'session#destroy'

end
