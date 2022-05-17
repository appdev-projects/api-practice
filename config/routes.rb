Rails.application.routes.draw do
  root "photos#index"

  resources :comments
  resources :follow_requests
  resources :likes
  resources :photos
  devise_for :users
end
