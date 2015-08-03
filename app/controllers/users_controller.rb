class UsersController < ApplicationController
  def show
  	@user_bookmarks = current_user.bookmarks
  	@liked_bookmarks = Like.where(user_id: current_user.id)
  end
end
