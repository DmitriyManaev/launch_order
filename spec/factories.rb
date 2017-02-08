require 'application_helper'
include ApplicationHelper

FactoryGirl.define do
  factory :role do
    name "User"
    description "Can make an order."
  end 
  
  factory :role_admin, class: Role do
    name "Admin"
    description "Can create, update and destroy meals and menus."
  end

  factory :user do
    name "Username"
    email "username@gmail.com"
    password "password"
    password_confirmation "password"
    role
  end

  factory :admin, class: User do
    name "Alex"
    email "alex@gmail.com"
    password "passw0rd"
    password_confirmation "passw0rd"
    association :role, factory: :role_admin
  end

  factory :daily_menu do
    date today_date
  end
  
  

  factory :order do
    
#    total_cost
#    user
  end

end