class Friendship < ActiveRecord::Base
  after_save :increment_followers_count
  after_destroy :decrement_followers_count
  belongs_to :user, counter_cache: :friends_count
  belongs_to :friend, class_name: "User"
  
  def increment_followers_count
    friend.increment!(:followers_count)
  end
  
  def decrement_followers_count
    friend.decrement!(:followers_count)
  end
end
