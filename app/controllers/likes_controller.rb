class LikesController < ApplicationController
	def create
	 @bookmark = Bookmark.find(params[:bookmark_id])
	 like = current_user.likes.build(bookmark: @bookmark)
	 authorize like
		if like.save
			flash[:notice] = "You like the bookmark of #{@bookmark.url}."
		else
			flash[:error] = "Error liking this bookmark."
		end
		redirect_to :back
	end


   def destroy
     # Get the bookmark from the params
     # Find the current user's like with the ID in the params
 	 @bookmark = Bookmark.find(params[:bookmark_id])
     like = current_user.likes.find(params[:id])
    authorize like	
     if like.destroy
        flash[:notice] = "You unLike for #{@bookmark.url}."
	else
		flash[:error] = "Error unliking #{@bookmark.url}."
	end
     redirect_to :back
   end
end
