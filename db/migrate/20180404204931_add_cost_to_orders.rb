class AddCostToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :cost, :float 
  end
end