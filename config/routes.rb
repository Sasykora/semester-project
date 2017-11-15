Rails.application.routes.draw do
  root 'channels#index'
  resources :posts
  resources :topics
  resources :channels
  resources :groups
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
