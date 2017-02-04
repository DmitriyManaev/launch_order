class Course < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  validates :name, :price, :course_type, presence: true
  has_and_belongs_to_many :daily_menus
end
