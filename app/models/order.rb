class Order < ActiveRecord::Base
  belongs_to :user
  validates :user_id, :first_course_id, :main_course_id, :drink_id, :date, :total_cost, presence: true
  scope :for_day, ->(date) { where(date: date) }

end
