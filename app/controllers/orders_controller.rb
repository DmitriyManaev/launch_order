class OrdersController < ApplicationController
  include ApplicationHelper

  def create
    order = Order.new
    order.assign_attributes(order_params)
    order.user_id = current_user.id
    order.date = today_date

    first_course_price = course_price(order.first_course_id)
    main_course_price = course_price(order.main_course_id)
    drink_price = course_price(order.drink_id)
    
    order.total_cost = first_course_price + main_course_price + drink_price

    if order.save
      flash[:success] = "Order added successfully!"
    else
      flash.now[:fail] = "Order not added!"
    end
    
    redirect_to root_path
  end

  private

  def course_price id
    Course.find(id).price
  end  

  def order_params
    params.permit(:first_course_id, :main_course_id, :drink_id)
  end

end