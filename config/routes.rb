Rails.application.routes.draw do
  get 'rooms/show'
  mount ActionCable.server => '/cable'

  get 'home/index'
  get "templates/*id" => 'templates#show', as: :template, format: false
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :users, only: [:new, :show, :create, :update]
  resources :photos, only: [:index, :show]
  resources :makeups, only: [:index, :show]
  resources :products, only: [:index, :show] do
    resources :comments
  end
  resources :events, only: [:index, :show] do
    resources :comments
  end
  resources :posts do
    resources :comments
  end
  resources :sessions, only: [:new, :create, :destroy] do
    collection do
      get :logout
    end
  end

  #user start
  namespace :users do
    resources :photos do
      member do
        post :like
        post :star
      end
    end
    resources :makeups
    resources :products
    resources :posts
    resources :events
  end
  #user end

end
