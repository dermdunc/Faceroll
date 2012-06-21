class DashboardsController < ApplicationController
  def show
    respond_to do |format|
      @updates = current_user.timeline.updates
      format.html do
        @post = Post.new
        @photo = Photo.new
        #@updates = Update.find_all_by_user_id(current_user.self_and_friend_ids)
        #@updates = current_user.updates.current
        @friends = current_user.friends
        @followers = current_user.followers
      end
      format.json { render json: @updates}
    end
  end
end