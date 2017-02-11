Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => {:registrations => "registrations"}
  root 'daily_menus#index'
  resources :orders, only: [:new, :create]
  resources :daily_menus, only: :index
  get 'get_daily_menus', to: 'get_daily_menus#index', as: 'get_daily_menu'

  scope '/api' do
    scope '/orders' do
      get '/' => 'api_orders#index'
    end
  end

end
