Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/dashboard/', to: 'users#dashboard'
  # get '/my-reviews/', to: 'reviews#index'

  resources :users do
    member do
      get 'my-books', action: :my_books, controller: 'books'
    end
    resources :purchases, only: [:show]
    get '/my-reviews/', to: 'reviews#index'
  end

  resources :books do
    resources :purchases, only: [:new, :create]
  end
  resources :purchases, only: [:index, :show] do
    resources :reviews, only: [:new, :create, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
