Rails.application.routes.draw do
  resources :articles, only: [:show, :index]
  devise_for :users
end
