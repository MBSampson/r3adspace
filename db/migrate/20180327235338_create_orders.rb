class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :buyer_name
      t.string :seller_name
      t.boolean :payment_confirmed
      t.string :address
      t.string :state
      t.integer :zipcode
      t.string :city

      t.timestamps
    end
  end
end
