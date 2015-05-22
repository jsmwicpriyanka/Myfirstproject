class MessagesController < ApplicationController
  before_action :authenticate_user!
	def inbox
    @messages = current_user.messages_received
  #    @message = Message.find(params[:id])
  #   @message.readingmessage if @message.reciever == current_user
   end
  def sentbox
    @messages = current_user.send_messages
  #    @message = Message.find(params[:id])
  #   @message.readingmessage if @message.reciever == current_user
   end

  def index
    @users=User.all
    @messages =Message.all
    #@messages = current_user.messages
  end

  def new
    @message=Message.new
  end

  def create
    # receiver_id = params[:id]
   #  sender_id = current_user.id 
    
    @message = current_user.send_messages.new(message_params)


    if @message.save
      flash[:message] = "Private Message Sent"
    end
    redirect_to new_message_path
      # redirect_to  recieve_message_path(@message) 
  end
  # user_path(@message.to_id)
  
  def recieve
  end

  private

  def message_params
    params.require(:message).permit(:text,:receiver_id,:sender_id)
  end
end