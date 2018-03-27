class AddSoldToAd < ActiveRecord::Migration[5.1]
  def change
    add_column :ads, :sold, :boolean, :default => false
  end
end
