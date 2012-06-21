class PostsController < ApplicationController
  def index
    @post = Post.all
    #@post = Post.scoped -> returns an active record collection
  end
  def create
    @post = Post.new(params[:post])
    @update = current_user.updates.build(content: @post)
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