class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :article

  validates :value, presence: true
end
