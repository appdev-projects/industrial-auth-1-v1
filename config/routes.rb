Rails.application.routes.draw do
  root "users#feed"

  devise_for :users
  
  resources :comments
  resources :follow_requests, except: [:index, :show, :new] #don't want get routes, but do want create update destroy
  resources :likes, only: [:create, :destroy] #don't need update because only 2 options here
  resources :photos, except: [:index, :show]

  get ":username" => "users#show", as: :user
  get ":username/liked" => "users#liked", as: :liked
  get ":username/feed" => "users#feed", as: :feed
  get ":username/discover" => "users#discover", as: :discover
  get ":username/followers" => "users#followers", as: :followers
  get ":username/following" => "users#following", as: :following
end
