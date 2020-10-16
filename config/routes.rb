Rails.application.routes.draw do
  devise_for :users, except: [:new, :create]
  resources :posts
  resources :users, except: [:destroy]

  get "/" => "home#top"
  get "about" => "home#about"
  get "check" => "home#check"
end
