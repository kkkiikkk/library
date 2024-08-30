Rails.application.routes.draw do
  resources :books, only: [:index, :show]

  devise_for :users
  root to: 'home#index'
end
