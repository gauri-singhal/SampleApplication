# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, :posts, :comments
  get "users/:id",  to: "posts#index"
  get "posts/index", to: "comments#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
