Rails.application.routes.draw do
  # Routes for the Subscription resource:

  # CREATE
  post("/insert_subscription", { :controller => "subscriptions", :action => "create" })
          
  # READ
  get("/subscriptions", { :controller => "subscriptions", :action => "index" })
  
  get("/subscriptions/:path_id", { :controller => "subscriptions", :action => "show" })
  
  # UPDATE
  
  post("/modify_subscription/:path_id", { :controller => "subscriptions", :action => "update" })
  
  # DELETE
  get("/delete_subscription/:path_id", { :controller => "subscriptions", :action => "destroy" })

  #------------------------------

  root "users#feed"

  devise_for :users

  resources :comments
  resources :follow_requests, except: [:index, :show, :new, :edit]
  resources :likes, only: [:create, :destroy]
  resources :photos, except: [:index]

  get ":username" => "users#show", as: :user
  get ":username/liked" => "users#liked", as: :liked
  get ":username/feed" => "users#feed", as: :feed
  get ":username/discover" => "users#discover", as: :discover
  get ":username/followers" => "users#followers", as: :followers
  get ":username/following" => "users#following", as: :following
end
