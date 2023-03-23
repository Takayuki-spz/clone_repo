Rails.application.routes.draw do
  root      "static_pages#home"
  get       "/",       to: "static_pages#home"
  get       "/signup", to: "users#new"
  get       "/login",  to: "sessions#new"
  post      "/login",  to: "sessions#create"
  delete    "logout",  to: "sessions#destroy"
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :microposts do
    resources :comments, only: [:create, :destroy, :edit, :update]
  end  
  resources :users
  resources :microposts,    only: [:create, :destroy, :show]
  resources :relationships, only: [:create, :destroy]
  get '/microposts', to: 'static_pages#home'
end
