Rails.application.routes.draw do
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :users, only: [:new, :create, :update]
  resources :photos
  resources :posts
  resources :sessions, only: [:new, :create, :destroy]

  namespace :user do
    resources :photos
    resources :posts
  end

end
