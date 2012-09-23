class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation
  has_one :picture
  acts_as_authentic
end
