class Order < ApplicationRecord
  belongs_to :user
  validates_presence_of :address, :state, :zipcode, :city, :buyer_last_name, :buyer_first_name
end
