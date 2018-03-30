class AddItemQuantityToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :item_quantity, :integer
  end
end
