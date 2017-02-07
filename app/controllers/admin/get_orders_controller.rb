class Admin::GetOrdersController < ApplicationController
  include OrderHelper

  def index
    orders = Order.where(date: DateTime.strptime(params[:date], "%d/%m/%Y"))
    total_cost = get_total_cost orders
    if orders.exists?
      render partial: 'order_items', locals: { orders: orders, total_cost: total_cost }
    else
      render html: "<strong>Not Found</strong>".html_safe
    end  
  end

end