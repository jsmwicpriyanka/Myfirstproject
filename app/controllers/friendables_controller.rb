class FriendablesController < ApplicationController
	before_action :authenticate_user!
	# after_save :created_friendship
	def show
		@friends = Friendable.all
	end


	def index
		friendables = Friendable.where(:sender_id => current_user.id)
		sender = friendables.map(&:receiver_id).uniq
		friendables = Friendable.where(:receiver_id => current_user.id)
		reciver = friendables.map(&:sender_id).uniq
		friendables = sender+reciver
		friendables << current_user.id                                                                           
		@users = User.where("id NOT IN (?)", friendables)
		 @reciver = current_user.request_reciver.where(accepted: nil)
		# @users = User.joins(:request_sender).where("friendables.sender_id != users.id and users.id != ? and friendables.receiver_id != users.id",current_user.id).uniq
	end

	def new
		@friendable =Friendable.new
	end

	def friend_request
	  receiver_id = params[:id]
	  sender_id = current_user.id 
    
		@friendable = Friendable.new(:receiver_id=> receiver_id, :sender_id=> sender_id, :accepted=> nil)
	  if @friendable.save
	  	flash[:success] = "request sent!"
	  	redirect_to friendables_path
	  else
      flash[:error] = @friendable.errors.full_messages
      redirect_to friendables_path
	  end
	end

	def friend_request_accept
	
		@friendable = Friendable.find_by(receiver_id: current_user.id, sender_id: params[:id])
  	@friendable.update_attributes(:accepted  => 1)
		flash[:notice] = "Requested Accepted"
	  redirect_to friendables_path
	end

	def friend_request_reject
	  @friendable = Friendable.find(params[:id])
	  @friendable.update_attributes(:accepted  => 0)
		flash[:notice] = "Requested Rejected"
		redirect_to friendables_path
	end

	private
	# def created_friendship
 #    sender.friends << receiver  if status_changed? && status == 'accepted'
 #  end


  def friendable_params
    params.require(:friendable).permit(:sender_id, :receiver_id, :user_id, :accepted)
  end
end
