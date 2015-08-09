class Topic < ActiveRecord::Base
  belongs_to :user
  has_many  :bookmarks, dependent: :destroy

  extend FriendlyId
  friendly_id :title, use: :slugged

  # easiest way to describe topic described in url
  # def to_param
  # 	"#{id} #{title}".parameterize
  # end

end
