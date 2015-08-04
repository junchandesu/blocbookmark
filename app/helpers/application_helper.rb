module ApplicationHelper

 def order_topic(bookmarks)
    bookmarks.each do |bookmark|
    	bookmark.topic 
    end
    bookmarks.order("topic_id")
  end

end

