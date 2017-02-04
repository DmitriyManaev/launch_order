class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.float :price
      t.string :course_type
      t.string :image

      t.timestamps null: false
    end
  end
end
