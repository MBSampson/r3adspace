class AddPublishedToAds < ActiveRecord::Migration[5.1]
  def change
    add_column :ads, :published, :string
  end
end
