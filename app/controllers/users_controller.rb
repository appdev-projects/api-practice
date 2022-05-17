class UsersController < ApplicationController
  def show
    @user = User.eager_load(feed: { owner: {}, likes: :fan, comments: :author}).find(params[:id])
  end
end