class TopicsController < ApplicationController
	include Pundit
	def index
		@topics = Topic.all
	end

	def new
	@topic = Topic.new
	authorize @topic
	end

	def show
		@topic = Topic.find(params[:id])
		@bookmarks = @topic.bookmarks.all
		authorize @topic
	end
	
	def create
		@topic = Topic.new(topic_params)
		@topic.user = current_user
		authorize @topic
		if @topic.save
			redirect_to root_path, notice: "Topic was saved."
		else
			flash[:error] = "Error creating topic."
			render :new
		end
	end

	def edit
		@topic = Topic.find(params[:id])
		authorize @topic
	end

	def update
		@topic = Topic.find(params[:id])
		authorize @topic
		if @topic.update_attributes(topic_params)
			redirect_to root_path, notice: "Topic was updated."
		else
			flash[:error] = "Error updating topic."
			render :edit
		end

	end

	def destroy
		@topic = Topic.find(params[:id])
		authorize @topic
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
