class Comment < ActiveRecord::Base
  paginates_per 6
  belongs_to :product
  attr_accessible :content, :nickname, :product_id
  attr_accessible :captcha, :captcha_key
  validates_presence_of :nickname, :content

end
