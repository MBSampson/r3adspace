class AddPriceToAds < ActiveRecord::Migration[5.1]
  def change
    add_column :ads, :price, :integer
  end
end
