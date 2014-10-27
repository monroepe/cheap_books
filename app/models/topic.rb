class Topic < ActiveRecord::Base
  belongs_to :user
  belongs_to :genre

  validates :title, presence: true
end
