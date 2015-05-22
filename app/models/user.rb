class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_one :profile
	has_many :posts
  
 
  has_many :send_messages, :class_name => "Message", :foreign_key => :sender_id
  has_many :messages_received, :class_name => "Message", foreign_key: :receiver_id
  
	# has_many :friendables
 #  validates_associated :friendables
  has_many :friends, :through => :friendables

  has_many :request_sender, :class_name => "Friendable", :foreign_key => :sender_id
  has_many :request_reciver, :class_name => "Friendable", :foreign_key => :receiver_id

  has_many :likes
  
  def already_likes?(post_comment)
    ilike = self.likes.where('likable_id = ? and likable_type = ?', post_comment.id , post_comment.class.to_s ).first
  end
end


