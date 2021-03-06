class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy

  validates :url, :title, presence: true
  validates :url, uniqueness: true
  validates :url, format: URI::regexp(%w(http https))
end
