module Admin
  class OrdersController < BaseController
    include ApplicationHelper
    include OrderHelper

    def index
      @orders = Order.where(date: today_date)
      @total_cost = get_total_cost @orders
    end

    def destroy
      order = Order.find(params[:id])
      
      if order && order.destroy
        flash[:success] = "Order destroyed."
      else
        flash[:fail] = "Order not destroyed."
      end  
      
      redirect_to admin_orders_path    
    end 

  end
end