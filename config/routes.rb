Rails.application.routes.draw do
  root "users#feed"

  devise_for :users

  resources :comments, only: [:create, :edit, :update, :destroy]
  resources :follow_requests, only: [:create, :update, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :photos, only: [:create, :new, :edit, :update, :destroy] 

  get ":username" => "users#show", as: :user
  get ":username/liked" => "users#liked", as: :liked
  get ":username/feed" => "users#feed", as: :feed
  get ":username/discover" => "users#discover", as: :discover
  get ":username/followers" => "users#followers", as: :followers
  get ":username/following" => "users#following", as: :following
end
