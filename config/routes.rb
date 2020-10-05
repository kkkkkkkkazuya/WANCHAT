Rails.application.routes.draw do
  devise_for :users
  root to: 'home#top'
  resources :posts
  resources :users, except: [:destroy]

  get "top" => "home#top"
  get "about" => "home#about"
  get "check" => "home#check"
end
