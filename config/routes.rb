Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  devise_for :views
  resources :games do
    resources :reviews
  end
  root 'games#index'
end
