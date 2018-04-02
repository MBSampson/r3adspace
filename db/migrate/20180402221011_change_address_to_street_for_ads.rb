class ChangeAddressToStreetForAds < ActiveRecord::Migration[5.1]
  def change
    rename_column :ads, :address, :street
  end
end
