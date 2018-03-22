class Ad < ApplicationRecord
  belongs_to :category
  belongs_to :user
  after_initialize :set_defaults

  validates_presence_of :title, :description, :price, :category_id
  validates :price,
            numericality: true,
            numericality: { :greater_than_or_equal_to => 0 }

  validates_format_of :image,
            with: /^((http[s]?|ftp):\/)?\/?([^:\/\s]+)((\/\w+)*\/)([\w\-\.]+[^#?\s]+)(.*)?(#[\w\-]+)?$/,
            message: "must be a URL link",
            multiline: true

  def set_defaults
    self.published ||= "draft"
  end
end
