class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :url, :title, presence: true
  validates :url, uniqueness: true
end
