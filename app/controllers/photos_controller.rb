class PhotosController < ApplicationController
  def create
    @photo = Photo.new(params[:photo])
    @update = current_user.updates.build(content: @photo)
    @update.save
    redirect_to dashboard_path
    
    #@post = current_user.posts.build(params[:post])
    #if @post.save
    #  redirect_to dashboard_path
    #else
    #  flash.now[:notice] = "Could not save post"
    #  render "dashboards/show"
    #end
  end
end