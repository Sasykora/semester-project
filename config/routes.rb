Rails.application.routes.draw do
  root 'channels#index'
  resources :posts
  resources :topics
  resources :channels
  resources :groups
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'company_manager_data', to: 'users#company_manager_data', as: 'company_manager_data'
  get 'company_manager_by_channel/:channel_id', to: 'users#company_manager_by_channel', as: 'company_manager_by_channel'
  get 'company_manager_by_user/:user_id', to: 'users#company_manager_by_user', as: 'company_manager_by_user'
  get 'company_manager_show_table/:sort', to: 'users#company_manager_show_table', as: 'company_manager_show_table'

  get 'admin/users/csv-upload', to: 'users#csv_upload', as: 'upload_users_csv'
  post 'admin/users/csv-upload', to: 'users#post_csv'


end
