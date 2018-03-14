class Ad < ApplicationRecord
  validates_presence_of :title, :description, :image, :price
end
