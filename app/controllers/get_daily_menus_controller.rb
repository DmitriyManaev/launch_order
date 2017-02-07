class GetDailyMenusController < ApplicationController
  
  def index
    date = params[:date]
    daily_menu = DailyMenu.where(date: DateTime.strptime(params[:date], "%d/%m/%Y")).first
    if daily_menu
      render partial: 'daily_menu_items', locals: { daily_menu: daily_menu }
    else
      render html: "<strong>Not Found</strong>".html_safe
    end  
  end
  

end