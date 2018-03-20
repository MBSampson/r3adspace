class Ad < ApplicationRecord
  belongs_to :category
  belongs_to :user
  after_initialize :init

  validates_presence_of :title, :description, :image, :price, :category_id

  def init
    self.published ||= "draft"
  end
end
