Rails.application.routes.draw do
  resources :posts
  root to: 'visitors#index'
  devise_for :users
end
