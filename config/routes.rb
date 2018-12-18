Rails.application.routes.draw do
<<<<<<< HEAD
  resources :games do
    resources :cells
  end
=======
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :users
  root :to => 'battleship#index'
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'


>>>>>>> sessions
  resources :cells do
    resources :moves
  end
  # get '/games/new' => 'game#update2'
end
