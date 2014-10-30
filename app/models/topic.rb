class Topic < ActiveRecord::Base
  belongs_to :user
  belongs_to :genre
  has_many :posts, dependent: :destroy

  validates :title, :genre_id, presence: true
end
