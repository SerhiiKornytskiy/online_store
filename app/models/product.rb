class Product < ActiveRecord::Base
  paginates_per 3
  has_many :line_items

  before_destroy :ensure_empty

  attr_accessible :description, :image_url, :price, :title, :id
  validates :description, :image_url, :price, :title, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.02}
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|png|jpg|jpeg)$}i, message: 'Invalid image type'
  }

  def ensure_empty
    line_items.empty?
  end
    
end
