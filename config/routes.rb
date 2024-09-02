Rails.application.routes.draw do
  resources :books, only: [:index, :show] do 
    resources :requests, only: [:create]
    resources :likes, only: [:create]
    resources :comments, only: [:create]
  end

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'home#index'
end
