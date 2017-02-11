class Course < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  validates :name, :price, :course_type, presence: true
  validates :price, numericality: true 
  has_many :menu_items, dependent: :destroy
  has_many :daily_menus, through: :menu_items
  scope :by_type, ->(type) { where(course_type: type) }

  def self.course_types
    ["first course", "main course", "drink"]
  end

  rails_admin do
    configure :name do
      label "Course name"
    end

    configure :menu_items do
      visible(false)
    end

    configure :course_type, :enum do
      enum_method do
        :course_types
      end
    end

    configure :daily_menus do
      visible(false)
    end
  end
end
