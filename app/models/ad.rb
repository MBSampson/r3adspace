class Ad < ApplicationRecord
  belongs_to :category
  belongs_to :user
  after_initialize :set_defaults

  # Configure for Paperclip
  has_attached_file :photo, styles:
  {
    large: "600x600>",
    medium: "300x300>",
    thumb: "150x150#"
  }, default_url: "/images/:style/missing.png"

  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  validates_presence_of :title, :description, :price, :category_id, :quantity
  validates :price,
            numericality: { :greater_than_or_equal_to => 0 }

  def set_defaults
    self.published ||= "draft"
  end
end
