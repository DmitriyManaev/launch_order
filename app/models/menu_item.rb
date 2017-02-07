class MenuItem < ActiveRecord::Base
  validates :course_id, :daily_menu_id, presence: true
  validates :course_id, uniqueness: { scope: :daily_menu_id }
  belongs_to :course
  belongs_to :daily_menu

end