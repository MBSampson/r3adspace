class AddBuyerToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :buyer_first_name, :string
    add_column :orders, :buyer_last_name, :string
  end
end
