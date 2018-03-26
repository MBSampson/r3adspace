class RemoveImageFromAd < ActiveRecord::Migration[5.1]
  def change
    remove_column :ads, :image, :text
  end
end
