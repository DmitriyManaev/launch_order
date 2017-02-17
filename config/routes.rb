Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  root 'daily_menus#index'
  get 'admin', to: 'admin/admin#index'
  resources :orders, only: [:new, :create]
  resources :daily_menus, only: :index
  get 'get_daily_menus', to: 'get_daily_menus#index', as: 'get_daily_menu'

  namespace :admin do
    resources :courses, except: [:show, :destroy, :create]
    post 'courses', to: 'courses#create', as: 'create_course'
    delete 'courses/:id', to: 'courses#destroy', as: 'delete_course'
    resources :orders, only: :index
    delete 'orders/:id', to: 'orders#destroy', as: 'delete_order'
    resources :daily_menus, only: [:index, :new, :create]
    resources :users, only: :index
    delete 'menu_items', to: 'menu_items#destroy', as: 'delete_menu_item'
    post 'menu_items', to: 'menu_items#create', as: 'add_item_to_menu'
    get 'get_orders', to: 'get_orders#index', as: 'get_orders'
  end

  scope '/api' do
    scope '/orders' do
      get '/' => 'api_orders#index'
    end
  end
end
