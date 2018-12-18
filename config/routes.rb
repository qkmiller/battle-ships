Rails.application.routes.draw do
  resources :games do
    resources :cells
  end
  resources :cells do
    resources :moves
  end
  # get '/games/new' => 'game#update2'
end
