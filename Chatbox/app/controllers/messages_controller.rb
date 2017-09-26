class MessagesController < ApplicationController
  
  def create
  	@chatroom = Chatroom.includes(:messages).find_by(id: params[:id])

	@message = current_user.messages.build(message_params)
	@message.chatroom = @chatroom
	if @message.save
		
		ActionCable.server.broadcast 'messages',
			message: @message.body,
			user: @message.user.username

		if (@chatroom.messages.length > 150)
			@chatroom.messages.first.destroy
		end
	else
		render 'chatroom/show'
	end
  end

  private

	def message_params
		params.require(:message).permit(:body)
	end

end