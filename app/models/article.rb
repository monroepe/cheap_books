class Article < ActiveRecord::Base
  belongs_to :user

  validates :url, :title, presence: true
  validates :url, uniqueness: true
end
