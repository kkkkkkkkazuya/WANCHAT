Rails.application.routes.draw do
  resources :posts
  
  get "/" => "home#top"
  get "about" => "home#about"
  get "check" => "home#check"
end
