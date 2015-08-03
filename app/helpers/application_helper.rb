module ApplicationHelper

 def order_topic(bookmarks)
    bookmarks.each do |bookmark|
    	bookmark.topic 
    end
    bookmarks.order("topic_id")
  end

	def order_topic_like(bookmarks)
		bookmarks.each do |mark|
			mark.bookmark.topic
		end
		bookmarks.order("bookmark.topic")
  	end


end

