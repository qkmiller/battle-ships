Rails.application.routes.draw do
  resources :cells do
    resources :moves
  end
end
