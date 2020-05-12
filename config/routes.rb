Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/show'
  get 'posts/new'
  get 'posts/edit'
  devise_for :users
  root to: "home#index"
  resources :users
end
