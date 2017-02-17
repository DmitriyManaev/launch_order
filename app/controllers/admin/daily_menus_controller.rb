module Admin
  class DailyMenusController < BaseController
    include ApplicationHelper
    
    def index
      @daily_menu = DailyMenu.where(date: today_date).first
      @courses = Course.order(:course_type).all
    end

    def create
      daily_menu = DailyMenu.new
      daily_menu.assign_attributes(date: today_date)
      
      if daily_menu.save
        flash[:success] = "Daily menu added successfully."
      else
        flash[:fail] = "Daily menu not added!"
      end 
      
      redirect_to admin_daily_menus_path
    end

  end
end