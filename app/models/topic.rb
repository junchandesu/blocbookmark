class Topic < ActiveRecord::Base
  belongs_to :user
  has_many  :bookmarks, dependent: :destroy


 def order_topic(bookmarks)
    bookmarks.order("topic")
  end

end
