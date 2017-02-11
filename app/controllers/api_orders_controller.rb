class ApiOrdersController < ActionController::Base
  include ApplicationHelper
  before_filter :authenticate

  def index
    @orders = Order.for_day(today_date)
    render json: @orders.map {|order| {
                               order_id: "#{order.id}",
                               user_name: "#{order.user.name}",
                               user_email: "#{order.user.email}",
                               first_course: "#{Course.find(order.first_course_id).name}", 
                               main_course: "#{Course.find(order.main_course_id).name}", 
                               drink: "#{Course.find(order.drink_id).name}",
                               total_cost: "#{Course.find(order.first_course_id).price + 
                                              Course.find(order.main_course_id).price + 
                                              Course.find(order.drink_id).price}"
                              }}
  end

  private

  def authenticate
    access_token = params[:access_token]

    if access_token
      @user = nil
      User.find_each do |user|
        if Devise.secure_compare(user.access_token, access_token)
          @user = user
        end
      end
    else
      render nothing: true, status: :unauthorized  
    end
  end

end