class ChangePriceToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :ads, :price, :float
  end
end
