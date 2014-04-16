class Friendship < ActiveRecord::Base
  after_save :reverse_friendship
  after_destroy :reverse
  belongs_to :user
  belongs_to :friend, :class_name => "User"
  private
  def reverse_friendship
    Friendship.create(user_id: self.friend_id,friend_id: self.user_id)
  end
end
