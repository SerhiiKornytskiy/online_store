class Comment < ActiveRecord::Base
  paginates_per 6
  belongs_to :product
  attr_accessible :content, :nickname, :product_id
  attr_accessible :captcha, :captcha_key
  validates_presence_of :nickname, :content  

  def self.censore(comment)
    @regex = /https?:\/\/[\S]+/
    @text = comment.content.split
    @text.map!{|e| @regex.match(e) ? e = "[external link]" : e}
    comment.content = @text.join(" ")
  end  

end
