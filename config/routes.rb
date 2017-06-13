Rails.application.routes.draw do
  resources :operators

  root to: 'pages#home'

  get '/show' => 'operator#show'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/logout' => 'session#destroy'



  # get "/" => "pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
