Rails.application.routes.draw do
  resources :floorplans

  resources :restaurants

  resources :operators

  get "/restaurants/:id/floorplans" => "floorplans#new"
  post "/restaurants/:id/floorplans/add" => "floorplans#add"
  put '/restaurants/:id/floorplans/:floorplanId/update' => 'floorplans#update'

  root to: 'pages#home'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/logout' => 'session#destroy'

end
