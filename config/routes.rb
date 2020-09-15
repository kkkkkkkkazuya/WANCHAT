Rails.application.routes.draw do
  get "/" => "home#top"
  get "about" => "home#about"
  get "check" => "home#check"
end
