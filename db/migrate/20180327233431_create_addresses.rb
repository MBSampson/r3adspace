class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :state
      t.integer :zip
      t.string :city

      t.timestamps
    end
  end
end
