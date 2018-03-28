class AddBuyerIdToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :buyer_id, :integer
  end
end
