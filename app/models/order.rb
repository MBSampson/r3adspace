class Order < ApplicationRecord
  validates_presence_of :address, :state, :zipcode, :city
end
