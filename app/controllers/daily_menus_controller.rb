class DailyMenusController < ApplicationController
  def show
    @daily_menu = DailyMenu.find(DateTime.now.begining_of_day)
  end


end
