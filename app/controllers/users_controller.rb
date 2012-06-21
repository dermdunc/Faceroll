class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @updates = current_user.updates.current
  end
end