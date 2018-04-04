class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.string :buyer_first_name
      t.string :buyer_last_name
      t.boolean :shipped
      t.string :ad_title
      t.float :total_amount
      t.integer :item_quantity
      t.string :shipping_street
      t.string :shipping_city
      t.string :shipping_state
      t.integer :shipping_zipcode
       
      t.timestamps
    end
  end
end
