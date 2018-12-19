Rails.application.routes.draw do

  root :to => 'games#index'
  #temporary root path for now

  resources :users, only:[:new, :create] do
   resources :chats, only: [:index, :show, :create]
  end

  resources :sessions, only:[:new, :destroy, :create]
    resources :messages, only:[:create]

  resources :games do
    resources :cells
  end
  resources :cells do
    resources :moves
  end
  # get '/games/new' => 'game#update2'
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
