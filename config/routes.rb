Rails.application.routes.draw do
  resources :compras
  resources :reservas
  resources :videojuegos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/videojuegos/join/reservas' , to: 'videojuegos#joinReservas'
  get '/videojuegos/join/compras' , to: 'videojuegos#joinCompras'
  delete '/reservas/join/videojuegos/:id' , to: 'reservas#joinVideojuegos'
  post '/reservas/all' , to: 'reservas#destroyAll'

  delete '/compras/join/videojuegos/:id' , to: 'compras#joinVideojuegos'


end
