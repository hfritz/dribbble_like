class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation, :pic
  has_one :picture
  
  has_attached_file :pic, 
        :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
        :url => "/system/:attachment/:id/:style/:filename",
        :styles => { :normal => "400x300", :thumb => "30x30" }
  #validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']
  
  acts_as_authentic
end
