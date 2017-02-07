class Admin::OrdersController < ApplicationController
  layout "admin"
  include ApplicationHelper
  include OrderHelper

  def index
    @orders = Order.where(date: today_date)
    @total_cost = get_total_cost @orders
  end

end