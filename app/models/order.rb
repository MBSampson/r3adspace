class Order < ApplicationRecord
  belongs_to :user
  validates_presence_of :address, :state, :zipcode, :city
end
