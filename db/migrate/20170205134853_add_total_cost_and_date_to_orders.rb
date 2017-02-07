class AddTotalCostAndDateToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :total_cost, :float
    add_column :orders, :date, :datetime
  end
end
