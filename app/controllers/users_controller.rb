class UsersController < ApplicationController
  def show
  	@user_bookmarks = current_user.bookmarks_by_topic
  	@liked_bookmarks = current_user.liked_bookmarks_by_topic
  end
end
