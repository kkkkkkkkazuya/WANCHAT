Rails.application.routes.draw do
  resources :posts
  resources :users, except: [:destroy]

  get "/" => "home#top"
  get "about" => "home#about"
  get "check" => "home#check"
end
