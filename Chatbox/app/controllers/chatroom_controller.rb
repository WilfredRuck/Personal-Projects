class ChatroomController < ApplicationController

	def index
		@chat_rooms = Chatroom.all
		if current_user
			@user = current_user
			@myChats = Chatroom.where(user_id: @user.id)
		end
	end

	def new
		@chat_room = Chatroom.new
	end

	def create
		@chat_room = current_user.chatrooms.build(chat_room_params)
	    @chat_room.user_id = current_user.id
	    
	    if @chat_room.save
	    	flash[:success] = 'ChatBox added!'
	    	redirect_to root_path
	    else
	    	flash.now[:alert] = 'Please enter a title.'
	    	flash.discard
	    	render 'new'
	    end
	end

	def show
		@chatroom = Chatroom.includes(:messages).find_by(id: params[:id])
		@message = Message.new
		@chatroomUsers = Array.new
		check = Array.new
		@chatroom.messages.each do |message|
			if !(check.include?(message.user_id))
				check.push(message.user_id)
				@chatroomUsers.push( (User.find_by(id: message.user_id)).username )
			end
		end
	end


	private

	def chat_room_params
		params.require(:chatroom).permit(:title)
	end

end
