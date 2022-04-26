Rails.application.routes.draw do
  root "users#feed"

  devise_for :users
  
  resources :comments, only: [:create, :edit, :destroy, :update]
  resources :follow_requests, only: [:create, :destroy, :update]
  resources :likes
  resources :photos

  get "feed" => "users#feed", as: :feed
  get "discover" => "users#discover", as: :discover
  get ":username" => "users#show", as: :user
  get ":username/liked" => "users#liked", as: :liked
  get ":username/followers" => "users#followers", as: :followers
  get ":username/following" => "users#following", as: :following
end