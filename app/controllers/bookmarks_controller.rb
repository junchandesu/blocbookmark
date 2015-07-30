class BookmarksController < ApplicationController

	def new
		@topic = Topic.find(params[:topic_id])
		@bookmark = Bookmark.new
	end

	def index
		@bookmarks = Bookmark.all

	end

	def edit
		@topic = Topic.find(params[:topic_id])
		@bookmark = @topic.bookmarks.find(params[:id])
		@bookmark.topic = @topic
	end

	def create
		@topic = Topic.find(params[:topic_id])
		@bookmark = @topic.bookmarks.build(bookmark_params)

		if @bookmark.save
			redirect_to @topic, notice: "Bookmark was saved."
		else
			flash[:error] = "Error saving bookmark."
			render :new
		end
	end

	def update
		@topic = Topic.find(params[:topic_id])
		@bookmark = @topic.bookmarks.find(params[:id])
		if @bookmark.update_attributes(bookmark_params)
			redirect_to @topic, notice: "Bookmark was updated."
		else
			flash[:error] = "Error updating bookmark"
			render :edit
		end
	end

	def destroy
		@topic = Topic.find(params[:topic_id])
		@bookmark = @topic.bookmarks.find(params[:id])
		if @bookmark.destroy
			redirect_to @topic, notice: "Bookmark was deleted"
		else
			flash[:error] = "Error deleting bookmark."
			render :show
		end
	end
	private

	def bookmark_params
		params.require(:bookmark).permit(:url)
	end
end