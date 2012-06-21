class Timeline
  def initialize (user_ids)
    @user_ids = user_ids
  end
  def updates
    Update.where(:user_id => @user_ids).current
  end
end