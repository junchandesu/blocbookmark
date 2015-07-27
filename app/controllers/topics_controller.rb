class TopicsController < ApplicationController

	def index
		@topics = Topic.all
	end

	def new
	@topic = Topic.new
	end

	def show
		@topic = Topic.find(params[:id])
		@bookmarks = @topic.bookmarks.all
	end
	def create
		@topic = Topic.new(topic_params)
		@topic.user = current_user
		if @topic.save
			redirect_to root_path, notice: "Topic was saved."
		else
			flash[:error] = "Error creating topic."
			render :new
		end
	end

	def edit
		@topic = Topic.find(params[:id])
	end

	def update
		@topic = Topic.find(params[:id])
		if @topic.update_attributes(topic_params)
			redirect_to root_path, notice: "Topic was updated."
		else
			flash[:error] = "Error updating topic."
			render :edit
		end

	end

	def destroy
		@topic = Topic.find(params[:id])
		if @topic.destroy
			redirect_to root_path, notice: "Topic was destroyed."
		else
			flash[:error] = "Error delating topic."
			render :show
		end

	end

	private

	def topic_params
		params.require(:topic).permit(:title)
	end

end
