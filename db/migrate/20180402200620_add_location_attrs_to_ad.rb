class AddLocationAttrsToAd < ActiveRecord::Migration[5.1]
  def change
    add_column :ads, :address, :string
    add_column :ads, :city, :string
    add_column :ads, :state, :string
    add_column :ads, :zipcode, :integer
  end
end
