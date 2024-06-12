Rails.application.routes.draw do
  
  get 'blogs/index'
  devise_for :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :motivations
  resources :motivations do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  resources :blogs do
    resources :loves, only: [:create, :destroy]
  end
  root 'motivations#index'
end
