class CoursesDailyMenus < ActiveRecord::Migration
  def change
    create_table :courses_daily_menus, id: false do |t|
      t.belongs_to :courses, index: true
      t.belongs_to :daily_menus, index: true 
    end  
  end
end
