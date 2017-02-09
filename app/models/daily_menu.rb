class DailyMenu < ActiveRecord::Base
  include ApplicationHelper

  has_many :menu_items, dependent: :destroy 
  has_many :courses, through: :menu_items
  validates :date, presence: true, uniqueness: true
  before_validation :set_date

  rails_admin do
    create do
      group :default do
        field :courses do
          hide
        end
      end  
    end

    configure :menu_items do
      visible(false)
    end
    
    configure :date do
      visible(false)
    end

    list do
      field :date
      field :courses
    end

  end

  private

  def set_date
    self.date = today_date
  end
end
