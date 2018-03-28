class RemoveSellerNameFromOrders < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :seller_name
  end
end
