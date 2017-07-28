Rails.application.routes.draw do
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :users, only: [:new, :create, :update]
  resources :photos
  resources :posts do
    resources :comments
  end
  resources :sessions, only: [:new, :create, :destroy]

  namespace :users do
    resources :photos do
      member do
        post :like
        post :star
      end
    end
    resources :posts
  end

end
