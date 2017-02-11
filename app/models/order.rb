class Order < ActiveRecord::Base
  belongs_to :user
  validates :user_id, :first_course_id, :main_course_id, :drink_id, :date, :total_cost, presence: true
  scope :for_day, ->(date) { where(date: date) }

  rails_admin do
    list do
      field :user

      field :first_course_id do
        formatted_value do
          Course.find(value).name
        end
      end

      field :main_course_id do
        formatted_value do
          Course.find(value).name
        end
      end

      field :drink_id do
        formatted_value do
          Course.find(value).name
        end
      end
      
      field :total_cost
      field :date
    end
  end
end
