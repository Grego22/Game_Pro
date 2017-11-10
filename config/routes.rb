Rails.application.routes.draw do
  devise_for :users
  devise_for :views
  resources :games
  root 'games#index'
end
