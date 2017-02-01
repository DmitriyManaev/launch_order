Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  resource :users
  resource :roles
  root 'users#profile'

# resources :orders, only: [:new, :create, :index]
end
