class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :buyer_name
      t.string :seller_name
      t.boolean :payment_confirmed

      t.timestamps
    end
  end
end
