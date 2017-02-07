class AddMenuItem < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.belongs_to :course, index: true
      t.belongs_to :daily_menu, index: true
      t.timestamps null: false
    end
  end
end
