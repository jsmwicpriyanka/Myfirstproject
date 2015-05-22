class Like < ActiveRecord::Base
	belongs_to :likable, polymorphic: true
	belongs_to :users

	# def destroy_like?
	# 	like = self.destroy.where('likable_id = ? and likable_type = ?', post_comment.id , post_comment.class.to_s )
	# 	if like.destroy?
	# 		true
	# 	else
	# 		false
	# 	end
	# end

end
