class Order < ActiveRecord::Base
  belongs_to :user
  validates :user_id, :first_course_id, :main_course_id, :drink_id, :date, :total_cost, presence: true

  private

  def orders_params
    params.require(:order).permit(:user_id, 
                                  :first_course_id, 
                                  :main_course_id, 
                                  :drink_id, 
                                  :total_cost, 
                                  :date)
  end 
end
