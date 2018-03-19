class Ad < ApplicationRecord
  belongs_to :category

  validates_presence_of :title, :description, :image, :price, :category_id
end
