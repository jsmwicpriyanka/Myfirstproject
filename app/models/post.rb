class Post < ActiveRecord::Base
	has_many :comments
	belongs_to :user
  validates :status, presence: true
  has_many :likes, as: :likable
  
end
