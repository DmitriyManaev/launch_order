class DailyMenusController < ApplicationController
  include ApplicationHelper

  def index
    @daily_menu = DailyMenu.where(date: today_date).first
    @order = Order.new
    if @daily_menu
      @first_courses = @daily_menu.courses.where(course_type: "first course")
      @main_courses = @daily_menu.courses.where(course_type: "main course")
      @drinks = @daily_menu.courses.where(course_type: "drink")
    else
      @first_courses = {}
      @main_courses = {}
      @drinks = {}
    end  
  end

end