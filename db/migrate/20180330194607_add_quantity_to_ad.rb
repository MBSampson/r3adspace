class AddQuantityToAd < ActiveRecord::Migration[5.1]
  def change
    add_column :ads, :quantity, :integer
  end
end
