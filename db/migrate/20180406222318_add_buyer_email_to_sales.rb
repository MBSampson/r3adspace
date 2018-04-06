class AddBuyerEmailToSales < ActiveRecord::Migration[5.1]
  def change
    add_column :sales, :buyer_email, :string, :default => ""
  end
end
