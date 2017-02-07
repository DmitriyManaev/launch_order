class Course < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  validates :name, :price, :course_type, presence: true
  validates :name, uniqueness: true
  has_many :menu_items, dependent: :destroy
  has_many :daily_menus, through: :menu_items

  def course_types
    ["first course", "main course", "drink"]
  end
end
