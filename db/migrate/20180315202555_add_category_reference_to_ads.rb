class AddCategoryReferenceToAds < ActiveRecord::Migration[5.1]
  def change
    add_reference :ads, :category, foreign_key: true
  end
end
