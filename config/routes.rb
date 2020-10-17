Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :users, except: [:new, :create, :destroy]

  get "/" => "home#top"
  get "about" => "home#about"
  get "check" => "home#check"
end
