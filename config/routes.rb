Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :users, except: [:new, :create, :destroy]

  resources :posts do
    post "like" => "likes#create"
    delete "/like" => "likes#destroy"
  end

  resources :users do
    get "likes" => "users#likes"
  end

  get "/" => "home#top"
  get "about" => "home#about"
  get "check" => "home#check"
end
