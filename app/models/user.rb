class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_digest
  
end
