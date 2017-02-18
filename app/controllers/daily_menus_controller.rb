class DailyMenusController < ApplicationController
  include ApplicationHelper

  def index
    @daily_menu = DailyMenu.where(date: today_date).first
    @order = Order.new
  end
end