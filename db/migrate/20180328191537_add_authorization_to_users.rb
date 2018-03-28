class AddAuthorizationToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :authorization, :string, :default => "user"
  end
end
