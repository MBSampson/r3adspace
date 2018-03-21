class RemovePublishedFromAds < ActiveRecord::Migration[5.1]
  def change
    remove_column :ads, :published, :string
  end
end
