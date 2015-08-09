class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :topics, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :bookmarks
  has_many :like_bookmarks, through: :likes, source: :bookmark
  validates :name, presence: true, uniqueness: true

  extend FriendlyId
  friendly_id :name, use: :slugged

  def liked(bookmark)
  	likes.where(bookmark_id: bookmark.id).first
  end

  def bookmarks_by_topic
    bookmarks.group_by { |b| b.topic }
  end

   def liked_bookmarks_by_topic
    like_bookmarks.group_by { |b| b.topic }
  end
end
