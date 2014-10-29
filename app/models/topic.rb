class Topic < ActiveRecord::Base
  belongs_to :user
  belongs_to :genre
  has_many :posts

  validates :title, :genre_id, presence: true
end
