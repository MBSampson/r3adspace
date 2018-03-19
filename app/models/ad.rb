class Ad < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates_presence_of :title, :description, :image, :price, :category_id
end
