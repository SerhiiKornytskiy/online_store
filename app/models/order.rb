class Order < ActiveRecord::Base
  
  has_many :line_items, dependent: :destroy

  attr_accessible :address, :email, :name, :pay_type
  PAYMENT_TYPE = ["Credit card", "Cash"]
  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPE
  validates :email, :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i} 

  def add_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
    
end
