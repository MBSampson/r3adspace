class Ad < ApplicationRecord
  belongs_to :category
  belongs_to :user
  after_initialize :init

  validates_presence_of :title, :description, :image, :price, :category_id
  validates :price,
            numericality: true,
            :numericality => { :greater_than_or_equal_to => 0 }
  def init
    self.published ||= "draft"
  end
end
