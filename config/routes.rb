Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/dashboard/', to: 'users#dashboard'
  # get '/my-reviews/', to: 'reviews#index'

  resources :users do
    resources :books, only: [:index], module: :users
    resources :purchases, only: [:index, :new, :create], module: :users do
      resources :reviews, only: [:new, :create]
    end
    resources :reviews, only: [:index], module: :users
  end
  resources :books do
    resources :purchases, only: [:new, :create]
  end
  resources :purchases, only: [:index] do
    resources :reviews, only: [:new, :create, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
