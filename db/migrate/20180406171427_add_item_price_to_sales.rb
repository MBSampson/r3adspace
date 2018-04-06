class AddItemPriceToSales < ActiveRecord::Migration[5.1]
  def change
    add_column :sales, :price, :float
  end
end
