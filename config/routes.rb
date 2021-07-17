Rails.application.routes.draw do
  resources :articles, only: [:show]
  devise_for :users
end
