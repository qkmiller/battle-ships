Rails.application.routes.draw do

  root :to => 'cells#index'

  resources :cells do
    resources :moves
  end
end
