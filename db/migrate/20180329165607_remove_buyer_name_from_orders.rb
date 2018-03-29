class RemoveBuyerNameFromOrders < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :buyer_name
  end
end
