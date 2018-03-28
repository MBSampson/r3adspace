class Order < ApplicationRecord
  belongs_to :user
  # has_many :ads
  validates_presence_of :address, :state, :zipcode, :city
end
