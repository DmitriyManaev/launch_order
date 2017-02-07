class DailyMenu < ActiveRecord::Base
  has_many :menu_items, dependent: :destroy
  has_many :courses, through: :menu_items
  validates :date, presence: true, uniqueness: true
  before_save 

end
