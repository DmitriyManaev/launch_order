Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  root 'daily_menus#index'
  get 'admin', to: 'admin#index'
  resources :orders, only: [:new, :create]

  namespace :admin do
    resources :courses, except: :show
    resources :orders, only: :index
    resources :daily_menus, only: [:index, :new, :create]
    resources :users, only: :index 
  end

  post 'admin/courses', to: 'admin/courses#create', as: 'create_course'
  delete 'admin/courses', to: 'admin/courses#destroy', as: 'delete_course'
  resources :daily_menus, only: :index
  post 'admin/menu_items', to: 'admin/menu_items#create', as: 'add_item_to_menu'
  get 'get_daily_menus', to: 'get_daily_menus#index', as: 'get_daily_menu'
  get 'get_orders', to: 'admin/get_orders#index', as: 'get_orders'
end
