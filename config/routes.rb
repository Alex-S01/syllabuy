Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users do
    resources :purchases, only: [:index]
  end
  resources :books do
    resources :purchases, only: [:new, :create]
  end
  resources :purchases, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
