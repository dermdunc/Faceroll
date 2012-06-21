class SearchesController < ApplicationController
  def show
    @updates = Update.search(params[:q])
  end
end