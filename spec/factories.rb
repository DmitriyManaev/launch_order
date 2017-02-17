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
    access_token "6b3300744c2ea3451a87"
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
  
  factory :course do
    name "something"
    price 10
    course_type "first course"
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'courses', 'test_image.jpg')) }
  end

  factory :first_course, class: Course do
    name "soup"
    price 30.0
    course_type "first course"
  end

  factory :main_course, class: Course do
    name "plov"
    price 40.0
    course_type "main course"
  end

  factory :drink, class: Course do
    name "coffee"
    price 50.0
    course_type "drink"
  end

  factory :order do
    user
    first_course_id 1
    main_course_id 2
    drink_id 3
    date today_date
    total_cost 120
  end

  factory :menu_item do
    course_id 1
    daily_menu_id 1
  end
  
end