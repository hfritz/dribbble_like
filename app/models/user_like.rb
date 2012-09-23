class UserLike < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user_id, :liked_user_id

end
