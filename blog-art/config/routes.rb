Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#home", as: "home_page"

  root "home#index"

  get "/users/:id" =>  "users#show", as: "user"

  resources :posts
  resources :comments


end
