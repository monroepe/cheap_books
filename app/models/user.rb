class User < ActiveRecord::Base
  has_many :articles
  has_many :comments
  has_many :topics
  has_many :posts
  has_many :votes

  validates :username, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
