Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  root 'users#profile'
  get 'daily_menus', to: 'daily_menus#show'
  get 'admin', to: 'admin#index'
  get 'users', to: 'users#get_users_list', as: 'get_users_list'
  resources :orders, only: [:new, :create]
  
  namespace :admin do
    resources :courses, except: :show
    resources :orders, only: :show
  end
  post 'admin/courses', to: 'admin/courses#create', as: 'create_course'
  delete 'admin/courses', to: 'admin/courses#destroy', as: 'delete_course'
  resources :cources, only: :show

end
