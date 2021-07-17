Rails.application.routes.draw do
  resources :articles, only: [:show, :index, :new, :create]
  devise_for :users
end
