class RemoveOrderReferencesFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :order_id
  end
end
