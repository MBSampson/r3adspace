class AddDefaultToShippedForSales < ActiveRecord::Migration[5.1]
  def change
    change_column :sales, :shipped, :boolean, :default => false
  end
end
