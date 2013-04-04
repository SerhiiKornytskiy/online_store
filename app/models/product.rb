class Product < ActiveRecord::Base

  paginates_per 9
  
  has_many :line_items
  has_many :comments, :dependent => :destroy

  before_destroy :ensure_empty
  mount_uploader :image_url, ImageUrlUploader

  attr_accessible :description, :image_url, :price, :title, :id
  validates :description, :image_url, :price, :title, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.0}
  validates_presence_of :image_url

  def ensure_empty
    line_items.empty?
  end

end
