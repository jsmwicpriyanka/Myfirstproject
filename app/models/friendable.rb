class Friendable < ActiveRecord::Base
	# belongs_to :user

 	belongs_to :sender, :class_name => "User", :foreign_key => :sender_id
 	belongs_to :receiver, :class_name => "User", :foreign_key => :receiver_id

 	# validates :sender_id, uniqueness: true
 	# validates :receiver_id, uniqueness: true
end
