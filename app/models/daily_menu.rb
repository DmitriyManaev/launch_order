class DailyMenu < ActiveRecord::Base
  include ApplicationHelper

  has_many :menu_items, dependent: :destroy 
  has_many :courses, through: :menu_items
  validates :date, presence: true, uniqueness: true
  before_validation :set_date

  private

  def set_date
    self.date = today_date
  end
end
